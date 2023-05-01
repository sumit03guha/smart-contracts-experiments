import { ethers } from 'hardhat';
import { expect } from 'chai';
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import {
  SafeVictim,
  UnsafeVictim,
  ReentrantAttacker,
  NonReentrantAttacker,
  ReentrantAttacker__factory,
  NonReentrantAttacker__factory,
  UnsafeVictim__factory,
  SafeVictim__factory,
} from '../typechain-types';

describe('Reentrancy test', async () => {
  let unsafeVictim: UnsafeVictim,
    safeVictim: SafeVictim,
    nonReentrantAttacker: NonReentrantAttacker,
    reentrantAttacker: ReentrantAttacker;

  let accounts: SignerWithAddress[],
    user1: SignerWithAddress,
    user2: SignerWithAddress,
    user3: SignerWithAddress,
    attacker: SignerWithAddress;

  beforeEach(async () => {
    accounts = await ethers.getSigners();
    user1 = accounts[0];
    user2 = accounts[1];
    user3 = accounts[2];
    attacker = accounts[3];

    const UnsafeVictim: UnsafeVictim__factory = await ethers.getContractFactory(
      'UnsafeVictim'
    );
    unsafeVictim = await UnsafeVictim.deploy();
    await unsafeVictim.deployed();

    const SafeVictim: SafeVictim__factory = await ethers.getContractFactory(
      'SafeVictim'
    );
    safeVictim = await SafeVictim.deploy();
    await safeVictim.deployed();

    await unsafeVictim
      .connect(user1)
      .deposit({ value: ethers.utils.parseEther('1') });
    await unsafeVictim
      .connect(user2)
      .deposit({ value: ethers.utils.parseEther('1') });
    await unsafeVictim
      .connect(user3)
      .deposit({ value: ethers.utils.parseEther('1') });

    await safeVictim
      .connect(user1)
      .deposit({ value: ethers.utils.parseEther('1') });
    await safeVictim
      .connect(user2)
      .deposit({ value: ethers.utils.parseEther('1') });
    await safeVictim
      .connect(user3)
      .deposit({ value: ethers.utils.parseEther('1') });
  });

  it('should let the attacker steal the funds from the unsafe contract', async () => {
    const ReentrantAttacker: ReentrantAttacker__factory =
      await ethers.getContractFactory('ReentrantAttacker');
    reentrantAttacker = await ReentrantAttacker.connect(attacker).deploy(
      unsafeVictim.address
    );
    await reentrantAttacker.deployed();

    await expect(
      reentrantAttacker
        .connect(attacker)
        .attack({ value: ethers.utils.parseEther('1') })
    )
      .to.emit(reentrantAttacker, 'Successful')
      .withArgs(ethers.utils.parseEther('4'));
  });

  it('should revert the transaction', async () => {
    const NonReentrantAttacker: NonReentrantAttacker__factory =
      await ethers.getContractFactory('NonReentrantAttacker');
    nonReentrantAttacker = await NonReentrantAttacker.connect(attacker).deploy(
      safeVictim.address
    );
    await nonReentrantAttacker.deployed();

    await expect(
      nonReentrantAttacker
        .connect(attacker)
        .attack({ value: ethers.utils.parseEther('1') })
    ).to.be.revertedWith('Transfer failed');
  });
});
