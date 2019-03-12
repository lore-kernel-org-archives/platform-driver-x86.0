From: valdis.kletnieks@vt.edu
Subject: Re: [PATCH] drivers/platform/x86/dell-rbtn.c - add missing #include
Date: Tue, 12 Mar 2019 18:53:09 -0400
Message-ID: <8385.1552431189@turing-police>
References: <17631.1552389966@turing-police>
 <20190312224611.elsl2buuhkddecih@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190312224611.elsl2buuhkddecih@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 12 Mar 2019 23:46:11 +0100, Pali Rohar said:

> Can you identify in which commit was introduced this problem? If yes,
> then Fixes: keyword should be added into commit message.

I admit not knowing how long that's been there - I mostly found myself
with a large amount of free time, a good supply of caffeine, and I got
irritated with how many warnings 'make C=2 W=1' throws, so I decided
to start going through and beating things into shape.  For those issues
where I can easily identify the regression point, I will include a Fixes: as I go..
