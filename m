From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: add support to mute and
 hardware optical switch
Date: Fri, 16 Mar 2018 12:09:07 +0100
Message-ID: <20180316110907.GK3523@nataraja>
References: <CAPqSeKv0Q+ocBYeonxi5w8XB0vaM27O1hcDm9ZDdXxCt7Py=Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPqSeKv0Q+ocBYeonxi5w8XB0vaM27O1hcDm9ZDdXxCt7Py=Pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kenneth Chan <kenneth.t.chan@gmail.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Kenneth,

thanks for your fix.  I'm not currently using any Panasonic Laptop devices
anymore (After the CF-R series was discontinued), so I'm not able to properly
maintain this driver anymore.

However, your changes look sound to me (aside from that we don't use C++ style
comments in kernel source code), hence:

Acked-by: Harald Welte <laforge@gnumonks.org>

-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
