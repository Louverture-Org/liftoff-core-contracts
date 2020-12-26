pragma solidity =0.6.6;

import "./interfaces/ILiftoffSettings.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

contract LiftoffSettings is
    ILiftoffSettings,
    Initializable,
    OwnableUpgradeable
{
    uint256 private ethXLockBP;
    uint256 private tokenUserBP;

    uint256 private insurancePeriod;

    uint256 private ethBuyBP;
    uint256 private baseFee;
    uint256 private projectDevBP;
    uint256 private mainFeeBP;
    uint256 private lidPoolBP;

    address private liftoffInsurance;
    address private liftoffLauncher;
    address private liftoffEngine;
    address private xEth;
    address private xLocker;
    address private uniswapRouter;

    address private lidTreasury;
    address private lidPoolManager;

    event LogEthXLockBP(uint256 ethXLockBP);
    event LogTokenUserBP(uint256 tokenUserBP);
    event LogInsurancePeriod(uint256 insurancePeriod);
    event LogXethBP(
        uint256 baseFee,
        uint256 ethBuyBP,
        uint256 projectDevBP,
        uint256 mainFeeBP,
        uint256 lidPoolBP
    );
    event LogLidTreasury(address lidTreasury);
    event LogLidPoolManager(address lidPoolManager);
    event LogLiftoffInsurance(address liftoffInsurance);
    event LogLiftoffLauncher(address liftoffLauncher);
    event LogLiftoffEngine(address liftoffEngine);
    event LogXEth(address xEth);
    event LogXLocker(address xLocker);
    event LogUniswapRouter(address uniswapRouter);

    function initialize() external initializer {
        OwnableUpgradeable.__Ownable_init();
    }

    function setEthXLockBP(uint256 _val) external override onlyOwner {
        ethXLockBP = _val;

        emit LogEthXLockBP(ethXLockBP);
    }

    function getEthXLockBP() external view override returns (uint256) {
        return ethXLockBP;
    }

    function setTokenUserBP(uint256 _val) external override onlyOwner {
        tokenUserBP = _val;

        emit LogTokenUserBP(tokenUserBP);
    }

    function getTokenUserBP() external view override returns (uint256) {
        return tokenUserBP;
    }

    function setLiftoffInsurance(address _val) external override onlyOwner {
        liftoffInsurance = _val;

        emit LogLiftoffInsurance(liftoffInsurance);
    }

    function getLiftoffInsurance() external view override returns (address) {
        return liftoffInsurance;
    }

    function setLiftoffLauncher(address _val) external override onlyOwner {
        liftoffLauncher = _val;

        emit LogLiftoffLauncher(liftoffLauncher);
    }

    function getLiftoffLauncher() external view override returns (address) {
        return liftoffLauncher;
    }

    function setLiftoffEngine(address _val) external override onlyOwner {
        liftoffEngine = _val;

        emit LogLiftoffEngine(liftoffEngine);
    }

    function getLiftoffEngine() external view override returns (address) {
        return liftoffEngine;
    }

    function setXEth(address _val) external override onlyOwner {
        xEth = _val;

        emit LogXEth(xEth);
    }

    function getXEth() external view override returns (address) {
        return xEth;
    }

    function setXLocker(address _val) external override onlyOwner {
        xLocker = _val;

        emit LogXLocker(xLocker);
    }

    function getXLocker() external view override returns (address) {
        return xLocker;
    }

    function setUniswapRouter(address _val) external override onlyOwner {
        uniswapRouter = _val;

        emit LogUniswapRouter(uniswapRouter);
    }

    function getUniswapRouter() external view override returns (address) {
        return uniswapRouter;
    }

    function setInsurancePeriod(uint256 _val) external override onlyOwner {
        insurancePeriod = _val;

        emit LogInsurancePeriod(insurancePeriod);
    }

    function getInsurancePeriod() external view override returns (uint256) {
        return insurancePeriod;
    }

    function setLidTreasury(address _val) external override onlyOwner {
        lidTreasury = _val;

        emit LogLidTreasury(lidTreasury);
    }

    function getLidTreasury() external view override returns (address) {
        return lidTreasury;
    }

    function setLidPoolManager(address _val) external override onlyOwner {
        lidPoolManager = _val;

        emit LogLidPoolManager(lidPoolManager);
    }

    function getLidPoolManager() external view override returns (address) {
        return lidPoolManager;
    }

    function setXethBP(
        uint256 _baseFeeBP,
        uint256 _ethBuyBP,
        uint256 _projectDevBP,
        uint256 _mainFeeBP,
        uint256 _lidPoolBP
    ) external override {
        require(
            _baseFeeBP + _ethBuyBP + _projectDevBP + _mainFeeBP + _lidPoolBP ==
                10000,
            "Must allocate 100% of eth raised"
        );
        baseFee = _baseFeeBP;
        ethBuyBP = _ethBuyBP;
        projectDevBP = _projectDevBP;
        mainFeeBP = _mainFeeBP;
        lidPoolBP = _lidPoolBP;

        emit LogXethBP(baseFee, ethBuyBP, projectDevBP, mainFeeBP, lidPoolBP);
    }

    function getBaseFeeBP() external view override returns (uint256) {
        return baseFee;
    }

    function getEthBuyBP() external view override returns (uint256) {
        return ethBuyBP;
    }

    function getProjectDevBP() external view override returns (uint256) {
        return projectDevBP;
    }

    function getMainFeeBP() external view override returns (uint256) {
        return mainFeeBP;
    }

    function getLidPoolBP() external view override returns (uint256) {
        return lidPoolBP;
    }
}
