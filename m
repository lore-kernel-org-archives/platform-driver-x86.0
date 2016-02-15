From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Mon, 15 Feb 2016 13:08:19 +0100
Message-ID: <87r3gew4zw.fsf@nemi.mork.no>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
	<1455531863-1294-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:59172 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752936AbcBOMI7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 07:08:59 -0500
In-Reply-To: <1455531863-1294-1-git-send-email-ike.pan@canonical.com> (Ike
	Panhc's message of "Mon, 15 Feb 2016 18:24:23 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Ike Panhc <ike.pan@canonical.com> writes:

> There are complains on few ideapads that wireless is always hard
> blocked but there is no physical radio switch. For now, we need
> each user to report its dmi information and ignore hard blocks
> on their ideapad. With more and more ideapads available in market
> to maintain the dmi table becomes never-ended job.
>
> I've checked lenovo website and for recent design none of the
> ideapads has radio switch. I do not believe there will be in the
> future. Therefore to disable hard block according to BIOS date is
> reasonable approach.
>
> This patch will disable rfkill hardblock if BIOS year > 2015.

Huh?  And what happens when a user upgrades the BIOS on older hardware?



Bj=C3=B8rn
