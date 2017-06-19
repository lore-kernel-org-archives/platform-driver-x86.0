From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-laptop: Fix bogus keyboard
 backlight sysfs interface
Date: Mon, 19 Jun 2017 10:47:43 +0200
Message-ID: <20170619084743.GB32387@pali>
References: <20170619073629.14239-1-kai.heng.feng@canonical.com>
 <20170619075742.GA32387@pali>
 <CAAd53p4H-4hhCo5iyYgSu9jL=jGqK2ztUtNMXnPYbpH8LySV7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35288 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdFSIrq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 04:47:46 -0400
Content-Disposition: inline
In-Reply-To: <CAAd53p4H-4hhCo5iyYgSu9jL=jGqK2ztUtNMXnPYbpH8LySV7Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: andy@infradead.org, Matthew Garrett <mjg59@srcf.ucam.org>, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday 19 June 2017 16:39:14 Kai-Heng Feng wrote:
> The same rule should also apply to kbd_info.levels, right?

IIRC no. levels = 1 means you can set two levels (0 and 1). Look into code.

-- 
Pali Rohár
pali.rohar@gmail.com
