import { ethers } from 'hardhat';
import { expect } from 'chai';
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import {
  SafeVictim,
  UnsafeVictim,
  SuccessfulAttacker,
  FailedAttacker,
  SuccessfulAttacker__factory,
  FailedAttacker__factory,
  UnsafeVictim__factory,
  SafeVictim__factory,
} from '../typechain-types';

describe('Vulnerability test', async () => {
  let unsafeVictim: UnsafeVictim,
    safeVictim: SafeVictim,
    failedAttacker: FailedAttacker,
    successfulAttacker: SuccessfulAttacker;

  let accounts: SignerWithAddress[],
    alice: SignerWithAddress,
    bob: SignerWithAddress,
    charlie: SignerWithAddress,
    attacker: SignerWithAddress;

  beforeEach(async () => {
    accounts = await ethers.getSigners();
    alice = accounts[0];
    bob = accounts[1];
    charlie = accounts[2];
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

    // Deposit 1 ETH into the smart contracts for each user

    await unsafeVictim
      .connect(alice)
      .deposit({ value: ethers.utils.parseEther('1') });
    await unsafeVictim
      .connect(bob)
      .deposit({ value: ethers.utils.parseEther('1') });
    await unsafeVictim
      .connect(charlie)
      .deposit({ value: ethers.utils.parseEther('1') });

    await safeVictim
      .connect(alice)
      .deposit({ value: ethers.utils.parseEther('1') });
    await safeVictim
      .connect(bob)
      .deposit({ value: ethers.utils.parseEther('1') });
    await safeVictim
      .connect(charlie)
      .deposit({ value: ethers.utils.parseEther('1') });
  });

  it('should let the attacker steal the funds from the unsafe contract', async () => {
    const SuccessfulAttacker: SuccessfulAttacker__factory =
      await ethers.getContractFactory('SuccessfulAttacker');
    successfulAttacker = await SuccessfulAttacker.connect(attacker).deploy(
      unsafeVictim.address
    );
    await successfulAttacker.deployed();

    await expect(
      successfulAttacker
        .connect(attacker)
        .attack({ value: ethers.utils.parseEther('1') })
    )
      .to.emit(successfulAttacker, 'Successful')
      .withArgs(ethers.utils.parseEther('4'));
  });

  it('should revert the transaction', async () => {
    const FailedAttacker: FailedAttacker__factory =
      await ethers.getContractFactory('FailedAttacker');
    failedAttacker = await FailedAttacker.connect(attacker).deploy(
      safeVictim.address
    );
    await failedAttacker.deployed();

    await expect(
      failedAttacker
        .connect(attacker)
        .attack({ value: ethers.utils.parseEther('1') })
    ).to.be.revertedWith('Transfer failed');
  });
});
