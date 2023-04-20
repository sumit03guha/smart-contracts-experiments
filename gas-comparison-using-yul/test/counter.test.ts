import { ethers } from 'hardhat';
import { expect } from 'chai';
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import { Counter, Counter__factory } from '../typechain-types';

describe('Counter contract', async () => {
  let Counter: Counter__factory;
  let counter: Counter;

  let owner: SignerWithAddress,
    user1: SignerWithAddress,
    user2: SignerWithAddress,
    user3: SignerWithAddress;

  beforeEach(async () => {
    const accounts: SignerWithAddress[] = await ethers.getSigners();
    owner = accounts[0];
    user1 = accounts[1];
    user2 = accounts[2];
    user3 = accounts[2];

    Counter = await ethers.getContractFactory('Counter');
    counter = await Counter.connect(owner).deploy();
    await counter.deployed();
  });

  it('should test loop1', async () => {
    await counter.loop1();
    expect(await counter.number()).to.equal(10);
  });

  it('should test loop2', async () => {
    await counter.loop2();
    expect(await counter.number()).to.equal(10);
  });

  it('should set external', async () => {
    await counter.setExternal(99);
    expect(await counter.number()).to.equal(99);
  });

  it('should set public', async () => {
    await counter.setPublic(99);
    expect(await counter.number()).to.equal(99);
  });
});
