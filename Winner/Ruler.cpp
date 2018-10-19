/**
 * Copyright (C) 2018 Shanghai YOUWAN Science & Technology Co., Ltd.
 * All rights reserved.
 *
 * This document is the property of Shanghai YOUWAN Science & Technology Co., Ltd.
 * It is considered confidential and proprietary.
 *
 * This document may not be reproduced or transmitted in any form,
 * in whole or in part, without the express written permission of
 * Shanghai YOUWAN Science & Technology Co., Ltd.
 */
#include "Ruler.h"
PAGAMES_WINNER_POKER_BEGIN

Ruler::Ruler()
{
    _isAlwaysWithPair       = false;
    _isKickerAlwaysSameRank = true;
    _isBombDetachable       = true;
    _isAsTrioAceBomb        = true;
    _isThreeOfHeartsFirst   = true;

    _masterTwoTheInvincible = true;
    _isAsTrioThreeBomb      = true;
}

Ruler &Ruler::getInstance()
{
    static Ruler _instance;
    return _instance;
}

bool Ruler::isAlwaysWithPair()
{
    return _isAlwaysWithPair;
}

bool Ruler::isKickerAlwaysSameRank()
{
    return _isKickerAlwaysSameRank;
}

bool Ruler::isBombDetachable()
{
    return _isBombDetachable;
}

bool Ruler::isAsTrioAceBomb()
{
    return _isAsTrioAceBomb;
}

bool Ruler::isThreeOfHeartsFirst()
{
    return _isThreeOfHeartsFirst;
}

bool Ruler::isMasterTwoTheInvincible() const
{
    return _masterTwoTheInvincible;
}

bool Ruler::isAsTrioThreeBomb() const
{
    return _isAsTrioThreeBomb;
}

PAGAMES_WINNER_POKER_END
