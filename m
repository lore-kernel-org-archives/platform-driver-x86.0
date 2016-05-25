From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v4] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Wed, 25 May 2016 22:47:03 +0200
Message-ID: <57b87380-6ea8-cdaf-b95c-4685fc2a85d1@gmail.com>
References: <20160524195726.GM2735@f23x64.localdomain>
 <1464123188-9589-1-git-send-email-gabriele.mzt@gmail.com>
 <20160525202847.GC109010@f23x64.localdomain> <201605252236.55715@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33856 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867AbcEYUrG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 16:47:06 -0400
In-Reply-To: <201605252236.55715@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: arvidjaar@gmail.com, rjw@rjwysocki.net, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-kernel@vger.kernel.org

On 25/05/2016 22:36, Pali Roh=C3=A1r wrote:
> On Wednesday 25 May 2016 22:28:47 Darren Hart wrote:
>> On Tue, May 24, 2016 at 10:53:08PM +0200, Gabriele Mazzotta wrote:
>>> Some BIOSes unconditionally send an ACPI notification to RBTN when
>>> the system is resuming from suspend. This makes dell-rbtn send an
>>> input event to userspace as if a function key was pressed. Prevent
>>> this by ignoring all the notifications received while the device
>>> is suspended.
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>>> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
>>
>> Gabriele, please include all the maintainers on Cc (Pali was
>> missing).
>=20
> Hehe, currently I started git send-email with my changes for v4 :D
> So doing CTRL+C in terminal...
>=20
>> Pali, can I have your Reviewed-by?
>=20
> Yes as my patch differs only in two words (in comments) :-)
>=20
> Anyway, there is missing Andrei's tested-by (from v2 version).

Sorry, I think this was not the first time I excluded Pali's address...

Anyway, there's also Alex's tested-by from v2, which is basically
the same as v4.

> Maybe also this should go to stable tree?
>=20
