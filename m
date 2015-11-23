From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Mon, 23 Nov 2015 15:48:58 +0100
Message-ID: <20151123144858.GE24147@pali>
References: <1448115375-7315-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34811 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753044AbbKWOtB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 09:49:01 -0500
Content-Disposition: inline
In-Reply-To: <1448115375-7315-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Borzenkov <arvidjaar@gmail.com>

On Saturday 21 November 2015 15:16:15 Gabriele Mazzotta wrote:
> Some BIOSes unconditionally send an ACPI notification to RBTN when th=
e
> system is resuming from suspend. This makes dell-rbtn send an input
> event to userspace as if a function key was pressed. Prevent this by
> ignoring all the notifications received while the device is suspended=
=2E
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>

Andrei Borzenkov (CCed) tested this patch and patch does not fix bug.
Probably there is race condition and ACPI event is sent *after* functio=
n
rbtn_resume is called.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
