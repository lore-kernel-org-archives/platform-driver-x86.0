From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Fri, 17 Jun 2016 01:01:10 +0200
Message-ID: <023b8dab-2c73-1b51-5cdb-19f5a54d4561@gmail.com>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160616031958.GA54214@f23x64.localdomain> <20160616073302.GT29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38435 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753864AbcFPXBN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jun 2016 19:01:13 -0400
In-Reply-To: <20160616073302.GT29844@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWU=?= =?UTF-8?B?xYQ=?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 16/06/2016 09:33, Pali Roh=C3=A1r wrote:
> On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
>> On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=C3=A1r wrote:
>>> First patch describe problem about 0xe045 code. Second and third ar=
e just
>>> cosmetic and last rework code which processing WMI events. It shoul=
d be
>>> properly tested on more Dell machines, to check that everything is =
still
>>> working correctly.
>>
>> Is this "should be properly tested on more Dell machines" still the =
case? Are
>> you ready for this to go into linux-next?
>=20
> Series should be OK, but I would like to see if someone else test thi=
s
> series... Gabriele, Alex or Andy? Do you have time?

I tested this series and everything seems to be working fine here.

Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
