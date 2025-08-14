Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376620C001
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173488; cv=none; b=KH9dXvoNrVgpBQY9jdihALJk5pfJbbRiwktSBUODnnu5t8g89t1QPpGGyNDkUbVtFvzhXGKQwqEv8b6jrQnWAZKYnP50RwKyzRX52TCZbQFKdmfdD5fSwFZ32MOMSYl5dT4hB0owF+6uV9N87nuWPwgYpNdxan0fckuf3XBca5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173488; c=relaxed/simple;
	bh=jRzzmFqxM1UHfbeBFYsmXn0I9s2tusLOHR6J0IYFk7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6L5WVd8zejx8CAlYJmOeIxXnA2ZcAtSmq2SzEhpUuej/z4iFfOgqdfu9/kR59d1IYc+V6m5ZxMkiIPrJmd4gkKUxpJS1S9KkpWMDXPg1XpycjHw7CyJbGjL04RlCMUUFQQfi1HNOMwRhNry/q96HBLQwJyjorhk2fyq8eBG9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Z6z7PQ5h; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Z6z7PQ5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1755173483; x=1755778283; i=w_armin@gmx.de;
	bh=jRzzmFqxM1UHfbeBFYsmXn0I9s2tusLOHR6J0IYFk7s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Z6z7PQ5hxAV7BtdEHkk1w9aPyhKOPYFzfuftE5O2ctTkWT9josCGr5wgJEJtebyA
	 3glhyOysnz0JLTZHyYC3YFq85AoBMptTExn4cidKGmcrzKQtEXcHsmfIhN9YfH/lE
	 MRNLiDqsphr9GqER1xsXUrRL0CImi2pWqIIMGiaJgDM33jSh9gPwy1rEXak37znvh
	 Ki3cKvAt4+7t5LhbT8EPlqF3xGOIPTKwU6a8gYJYN6ARgnRBfThDvmjtzVgCrXEYD
	 B0FMu29J6noCm2RnsDgLQ0n552PH0jAMOOTI/9v1f0UxjT/ov4oQMu30bNDp8XhyR
	 NovfqwbF28JojRpEyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.231.131]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1ugk2w2okv-005AKt; Thu, 14
 Aug 2025 14:11:23 +0200
Message-ID: <b56c74bc-ce71-4ab8-a804-3d5d3de247b1@gmx.de>
Date: Thu, 14 Aug 2025 14:11:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
To: Lynne Megido <lynne@bune.city>, platform-driver-x86@vger.kernel.org
Cc: jlee@suse.com
References: <3f56e68f-85df-4c0a-982c-43f9d635be38@bune.city>
 <13f268a6-ec17-4a97-ae69-4aec723d4329@gmx.de>
 <a720d568-ea56-4e27-9d28-66b60a681e69@bune.city>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a720d568-ea56-4e27-9d28-66b60a681e69@bune.city>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S2SJIBRIF6rVNoHeJRME9XKJRZQCpmbVV6tVTnBB+PnU+UQ5GMF
 s+TF1JdM+E3SMtqq/ytZ3y14ImCFpCZTZuPhMkQqW8XyrdfPqmF8VJ9h2oX9yRlVXYtvg7N
 ednEbX0cp48P51p9sX4X45BYYQ0TOco7S6bIZ5LLvoDyRxE9G8dY0WfR+zF7ewTTd5koDiv
 HNLx/vcPi+DqYD+x22P+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oDAh6NDH74w=;D+8VfQXOluhMxdx1zGoon/2JZ0e
 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
 4PwIhPt//I3fBDaci0Ts8SJMvrvYQrpdcd84W

Am 13.08.25 um 00:41 schrieb Lynne Megido:

> > Can you first load this driver and share the dmesg output then?
>
> Sure, I've done that:
>
> lynne@pasiphael:~/Downloads/acer-wmi 45ms 8.51% 7GiB/31GiB
> =E2=9D=AF make
> make -C /lib/modules/`uname -r`/build M=3D`pwd` modules
> make[1]: Entering directory '/usr/src/kernels/6.15.9-201.fc42.x86_64'
> make[2]: Entering directory '/home/lynne/Downloads/acer-wmi'
> =C2=A0 CC [M]=C2=A0 acer-wmi.o
> =C2=A0 MODPOST Module.symvers
> =C2=A0 CC [M]=C2=A0 acer-wmi.mod.o
> =C2=A0 CC [M]=C2=A0 .module-common.o
> =C2=A0 LD [M]=C2=A0 acer-wmi.ko
> =C2=A0 BTF [M] acer-wmi.ko
> Skipping BTF generation for acer-wmi.ko due to unavailability of vmlinux
> make[2]: Leaving directory '/home/lynne/Downloads/acer-wmi'
> make[1]: Leaving directory '/usr/src/kernels/6.15.9-201.fc42.x86_64'
> lynne@pasiphael:~/Downloads/acer-wmi 66ms 1.87% 9GiB/31GiB
> =E2=9D=AF sudo modprobe -r acer-wmi
> lynne@pasiphael:~/Downloads/acer-wmi 40ms 2.45% 8GiB/31GiB
> =E2=9D=AF sudo modprobe sparse_keymap
> lynne@pasiphael:~/Downloads/acer-wmi 36ms 1.15% 8GiB/31GiB
> =E2=9D=AF sudo modprobe platform_profile
> lynne@pasiphael:~/Downloads/acer-wmi 33ms 1.22% 8GiB/31GiB
> =E2=9D=AF sudo modprobe wmi_bmof
> lynne@pasiphael:~/Downloads/acer-wmi 42ms 2.76% 8GiB/31GiB
> =E2=9D=AF sudo insmod acer-wmi.ko
> lynne@pasiphael:~/Downloads/acer-wmi 43ms 2.37% 10GiB/31GiB
> =E2=9D=AF sudo dmesg | tail -n 6
> [=C2=A0 179.600745] acer_wmi: Acer Laptop ACPI-WMI Extras
> [=C2=A0 179.600775] acer_wmi: Function bitmap for Communication Button: =
0x801
> [=C2=A0 179.610473] input: Acer WMI hotkeys as /devices/virtual/input/in=
put36
> [=C2=A0 179.629948] acer_wmi: Supported platform profiles: 0
> [=C2=A0 179.629951] acer-wmi acer-wmi: Failed to register platform_profi=
le=20
> class device with empty choices
> [=C2=A0 179.634840] acer-wmi acer-wmi: probe with driver acer-wmi failed=
=20
> with error -22
>
I see, did the platform profile interface work on your machine before kern=
el 6.14?

> > Additionally could you share the output of "acpidump"?
>
Thanks, but next time please attach the resulting text file to the email i=
nstead.

Armin Wolf

