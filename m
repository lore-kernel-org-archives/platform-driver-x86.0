From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Thu, 12 Oct 2017 16:33:35 +0200
Message-ID: <20171012143335.bbw3cxojzp66nqi2@pali>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <1200feb837864baa8a3be9740413f2e9@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55820 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751853AbdJLOdi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2017 10:33:38 -0400
Content-Disposition: inline
In-Reply-To: <1200feb837864baa8a3be9740413f2e9@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: gnomes@lxorguk.ukuu.org.uk, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

On Thursday 12 October 2017 13:23:08 Mario.Limonciello@dell.com wrote:
> The existing dcdbas calling interface tooling (libsmbios) expects to be able 
> to access all calls and all tokens.  *The kernel doesn't filter any of it.*

It does not mean that API/ABI was designed correctly or incorrectly.
Existing old API/ABI is there and we are not going to change it...

> I understand the ask to filter some calls and that's why patch 10/15 exists,
> but please let me remind you this patch series is intended to /replace and
> deprecate/ dcdbas userspace access.

Now when there is a proposal for a new API/ABI, it should be designed
correctly without need to redesign it again in future and address all
problems which are found during review.

-- 
Pali Rohár
pali.rohar@gmail.com
