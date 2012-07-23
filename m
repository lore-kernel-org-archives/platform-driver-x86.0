From: =?ISO-8859-1?Q?Miguel_G=F3mez?= <magomez@igalia.com>
Subject: Re: [PATCH 1/1 v2] classmate-laptop: Add support for Classmate V4
 accelerometer.
Date: Mon, 23 Jul 2012 15:33:27 +0200
Message-ID: <500D52A7.8040606@igalia.com>
References: <cover.1340976795.git.magomez@igalia.com> <39ac42c709e498fbef4f0f0f24edc5331e5f4473.1340976795.git.magomez@igalia.com> <20120717224749.GA20813@nautilus.holoscopio.com> <5006BFEC.1010407@igalia.com> <20120723132841.GD21495@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:50404 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752539Ab2GWNda (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jul 2012 09:33:30 -0400
In-Reply-To: <20120723132841.GD21495@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, don@syst.com.br, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

El 23/07/12 15:28, Matthew Garrett escribi=F3:
> On Wed, Jul 18, 2012 at 03:53:48PM +0200, Miguel G=F3mez wrote:
>
>>> 1) reverting the patch in acpica that puts all names in uppercase
>>> 2) using a case-insensitive match in acpi bus driver
>>> 3) using uppercase name in classmate-laptop driver
>>
>> I think the easiest and less risky way to fix this is by adding a
>> new hardware id (as proposed in the thread's patch), as it doesn't
>> add any side effects (that the other solutions might add), and it
>> doesn't break the behaviour of the old code.
>
> I've lost track of the implementation state here - if all names are
> upper-cased in acpica, why is this not already matching?

Names are upper-cased in acpica, so the device is reported as FNBT0000.=
=20
But in the driver it's named FnBT0000, and that's why it doesn't match.

--=20
Miguel G=F3mez
Igalia - http://www.igalia.com
