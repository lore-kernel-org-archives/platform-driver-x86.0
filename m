Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1292D481D
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323447; cv=none; b=YshLjHU55SzGKJ/nMHa88e7ILxWnikCCl/ndsBXiW6JG3kw7RTviY8Gxsnxr54M0ynvOsMzCs0R6GOsFrL6+PqLW0h/fq62r/POrvcJRPXAmi3/+BtZdG7nWS9corV0wqt5P5Q9RD0FkBvuTBaineEu+8eiFTjAWlwSMPVlULzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323447; c=relaxed/simple;
	bh=RjNu8JWXXoPvnCJGqYIJeTScRqlt129OPIujVdQcie4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shm5jcq2ujGpFxOdDqWa8+sT5csFyPcTb8rIPzQq2Ph7i5CxP7mb5MjexmsRALtRoFkl/KqSM6m6pOW3G9zGT02wWqIq70dnUmY2Xa43WwBEfdRNF+UPWekeoEIInrCm5kVk1MHwkq/LKZOvZXZfMPF/OqRJ8iPjKUIHbpAtk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=V0oxubHY; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="V0oxubHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756323436; x=1756928236; i=w_armin@gmx.de;
	bh=RjNu8JWXXoPvnCJGqYIJeTScRqlt129OPIujVdQcie4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V0oxubHYazmdJGvf3fmSeOBnC9MPh5OtIpjeXmAoVNVa/uD45cR+XN3T6CtKaFpo
	 CPedGebKiZZDbeiAgyNEQfu6AfxPAv2tFj4oSZwKEPGkLE/wPfa7WvS08EekoyGZ8
	 4PgdCZ/Xl1Vqt640QcSBcMHdmz/FhDCl01k4KZGcK2M0NuBke95AlEQPjrPv3p6dO
	 5XUJXvA3YGup4c1X8r1JNrBUb3/iVsK6E7WXlFblTD4okmcE9kMVU76PozT8Aiv6i
	 RvOJiq3TcuXaO6/qElAInkrwpMfTeXO1jDsVyqRQ0m0i48nQ6xOxrjVYvLqz3KCB4
	 omD6l/twYef2wKRo3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.19.132.1] ([176.3.64.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1u7b8W2csB-00l8ma; Wed, 27
 Aug 2025 21:37:16 +0200
Message-ID: <31d68a01-62ad-4cd5-80fe-99650c0adee9@gmx.de>
Date: Wed, 27 Aug 2025 21:37:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
To: SungHwan Jung <onenowy@gmail.com>, Lynne Megido <lynne@bune.city>
Cc: platform-driver-x86@vger.kernel.org
References: <pyvalwtuobljjedr7e6xn2attiazy6m7ks4uv3zz5zumwsowag@yvkdhmdtgzvb>
 <831b9f1a-a4e5-4328-9db1-f703c8341704@bune.city>
 <jvfcaqkeljzzuhi7f55usgjcqob6wxqoddwhe575elnyioqrdw@on2kdd5l6lom>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <jvfcaqkeljzzuhi7f55usgjcqob6wxqoddwhe575elnyioqrdw@on2kdd5l6lom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9RUnzTE4rnnYwbY2muF0NlKJvcRgnU+WlnCzeajaSL8Prs4In6r
 d+WDBgtJ0wzr/+9xmnAYrAy8RkFSczFCAzSbmxhKOnynajOpXIFuV4iyD+RsSiXynslisUt
 32phCvrPM0BK2teVcWQOorViiDoE2jajbVQyT384Ym81/txOzltbVC2r9HEqZWuLbT8X3Hf
 yzdoffpabQpI7LU6UuLXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:twypNDcjXVQ=;xAm4FYtRrX8piWMthiiyf6iSOmJ
 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

Am 27.08.25 um 10:52 schrieb SungHwan Jung:

> On Wed, Aug 27, 2025 at 05:13:15PM +1000, Lynne Megido wrote:
>> I'll test a live image with a recent kernel to see how that goes. I don=
't
>> have the
>> time for that today, but I'll get to that when I can.
> Thank you for your reply.
>
> If, in your testing, the system also works correctly on other distributi=
ons
> without the patch=E2=80=94or if the issue there can be resolved without =
the patch
> simply by manual or delayed loading=E2=80=94then adding EPROBE_DEFER sho=
uld be
> sufficient on those distributions. For Fedora, if the configuration that
> contributes to the more severe behavior is adjusted, the problem should =
also
> be resolved by adding EPROBE_DEFER alone, just like on the other distrib=
utions,
> without removing the ACPI bitmap-related code.

IMHO using EPROBE_DEFER to work around an unreliable firmware interface is=
 not OK, that is not
the purpose of EPROBE_DEFER. Instead i strongly suspect that i misinterpre=
ted the purpose of the
bitmap in question when suggesting to use it for the detection of the plat=
form profiles, and that
this bitmap represents some other setting that apparently has nothing to d=
o with the platform
profile feature itself.

Because of this i suggest that we ignore the ACPI bitmap for now until we =
figure out how the
original OEM application detects available platform profiles.

Thanks,
Armin Wolf

>> However, I can attest that the issue you mention where the module doesn=
't
>> work after
>> failing once on Fedora doesn't occur on my system. I just started my la=
ptop
>> with
>> Fedora's 6.15 kernel, and the `acer-wmi` module loaded at startup, and
>> failed (as
>> expected). I then unloaded it and loaded the patched driver, which work=
ed:
>>
>>
>> ```
>>
>> lynne@pasiphael:~/Downloads/acer-wmi2s315ms3.78%11GiB/31GiB
>> =E2=9D=AFsudo dmesg | rg acer
>> [ =C2=A0=C2=A0=C2=A01.248981] acer_wmi: Acer Laptop ACPI-WMI Extras
>> [ =C2=A0=C2=A0=C2=A01.249000] acer_wmi: Function bitmap for Communicati=
on Button: 0x801
>> [ =C2=A0=C2=A0=C2=A01.280006] acer-wmi acer-wmi: Failed to register pla=
tform_profile class
>> device with empty choices
>> [ =C2=A0=C2=A0=C2=A01.284834] acer-wmi acer-wmi: probe with driver acer=
-wmi failed with
>> error -22
>> [ =C2=A0=C2=A0=C2=A08.127947] acer_wmi: Unknown function number - 9 - 0
>> [ =C2=A0=C2=A033.811949] acer_wmi: Acer Laptop WMI Extras unloaded
>> [ =C2=A0=C2=A034.414034] acer_wmi: Acer Laptop ACPI-WMI Extras
>> [ =C2=A0=C2=A034.414080] acer_wmi: Function bitmap for Communication Bu=
tton: 0x801
>> [ =C2=A0=C2=A047.616969] acer_wmi: Unknown function number - 9 - 1
>>
>> ```
>>
>> As you can see, despite the built-in module failing to load at boot, I =
was
>> able to
>> successfully insert the new module later without needing to blacklist t=
he
>> built-in
>> module and reboot.
>>
>>
>> Lynne
>>
> I tested without applying the patch. The issue occurs more frequently on
> Fedora than on other distributions, and manual loading has no effect.
> Therefore, I suspect that certain default configurations in Fedora make =
the
> issue more noticeable.
>
> Thank you.
>
