Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135772;
	b=n4a8XvKlOeTvGxxYS9qhFXR2y+xEmSspuUcKnFZsxOUzb8vrm1xMhF3nAa9wQ5E0CaYG
	 pPxcfxP1G9JXGVsd9HLKcDx7fzELSZ9ARLkN5JGNwRJWsg9wB++Uwe4Yh+Et/7Y087qYP
	 5TJ5FyMed3pzfR3gmYZiOwU5VkS724HiulzZL7y7YxmvE183iE8DQvQx7yl5Hx7BE197X
	 x4ifeSkQRwbi2quRK1QdddSi1c1DXDhu92jfUvqH6gqgyEupD6s+N08MkfV3VSIkZgkq0
	 Rgkq1P3vMrgNHj/i+mPR5RHeLGzjZYAhI97v4mS0hm/Kx9X4XUGmkBdqJlCNzK/TtjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135772;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=5ePV20AC2I0wgORRYIw5A8QXTBLFN4DIgXOlKGVAIFE=;
	b=m+Kc3RZMsUUnK2eu/r0EsQGFxMc8IwQ1Q3cZlhXA0S/1JBIqsRyRmlvKY6pDTrx6SFtt
	 dQCwPxZbxPVQq81wzUjEXxqNPhutJLvfwn0SPkgEsMjBW2yRGQFw9HwXYrEioQS9pvoqc
	 1OE6pZG6I2h1G/YwpZY/IHHQ0+8Ll7Sb269hZTkKCugYnNLOjG/NhaNc1bK+QCOK+Go6o
	 3nq8xu99+gUeokHjGHvZGBjSxwMtyOcX5vtgeHa0bl8sqOhd5jui5c8jQ368DkNdElBTw
	 ru7SkeXZ6z/tyMmrnoyJRvsZbgLS/vfQyv9uq0i8JIWKokeDyB/1H4ylDUEZKceZPyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=(null) smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JMiLSg2c;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA0606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 21:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EAA0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JMiLSg2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793135765; x=1793740565; i=w_armin@gmx.de;
	bh=5ePV20AC2I0wgORRYIw5A8QXTBLFN4DIgXOlKGVAIFE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JMiLSg2cbq5bcDycwB7QP6oZjP09c4t7m2Owa+Lbq8o8eZjCVgivS6C6HEH1WYP4
	 KwH44AelVnkWZWIbsASz/Y/WjcJ/kBrRZcvrH0Ue5gh3eikps/TnUYbKy7lCIJ/Li
	 VYEfJkDeQMEUvWJOO5XBXo9ozfq4HWavHm2IPswhLgCJxE2qeXZwS5s1Ik+TjaIZU
	 T3qNwNaTSnoE/kIhNv0yJBSVnMLy7f+9GgMPKAX2aDA5EGthToyrWbn7sC+3ajYsD
	 N5fSs15beZiiE8Oey7a7x5zavjr0FCF17X7/5FFv5Ou6lt3xztTzBWjC+Zbc9zUkD
	 4p9ahXFZVZyY3MJaEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1x1pu814cz-00S3pn; Tue, 27
 Oct 2026 22:16:05 +0100
Message-ID: <d8998de2-156f-4d0c-8cc6-8e08b83e6d41@gmx.de>
Date: Tue, 27 Oct 2026 22:16:04 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: uniwill-laptop: Add support for SLIMBOOK Executive
 14 UC2
To: kinhelm@duck.com
Cc: platform-driver-x86@vger.kernel.org
References: <ec14dfae-6020-4f91-bd0e-1778cb5e32da.ref@yahoo.fr>
 <BA6C06BF-3AEF-49A0-973B-872A05825197.1@smtp-inbound1.duck.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <BA6C06BF-3AEF-49A0-973B-872A05825197.1@smtp-inbound1.duck.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tf2aEZHC6cHxTQSwwUYoNEKj2Mr4l4S8q+geVexI5/lz1D5Hb4v
 hw618D7Y4qOxEpWvTK8D8I98QxMfsw1QCIcERjH1LpnPnCaaySsMeC4I9ByTC6vn+K60t4t
 drzGOU74BHN7lorZPWHkcc+y8wbyzJ7dUror/piGBd4TCAu5jRoNVzbmkzzSC3abd9pNs0O
 jXQSbRftsOfK8wJn/TygA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Lk5oZcsx+zE=;f6Iaptmw+Sd7w0xYh7a3Ii1qqvD
 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
 w/OpNU5LORE0x0vPD5ayoRflxL0TSerEExs/dnk=

Am 27.10.26 um 17:57 schrieb kinhelm@duck.com:

> Hello,
>
> The uniwill-laptop driver works on my SLIMBOOK Executive-14-UC2
> (Intel Arrow Lake) when loaded with force=3D1, but the device is not
> in the DMI match table, so it does not load automatically.
>
> Kernel: 7.2.11-zen1-1-zen (Arch Linux)
>
> With force=3D1:
> - "Uniwill Battery Extension" battery hook registers
> - charge_types shows "Trickle [Standard] Long_Life",
> =C2=A0 switching to Long_Life works
> - "Uniwill WMI hotkeys" input device is created
> - hwmon "uniwill" reports 2 fans and temperatures
> - ACPI device INOU0000 is present
>
> dmidecode -t system -t baseboard:
>
> =C2=A0 System Information
> =C2=A0 =C2=A0 =C2=A0 Manufacturer: SLIMBOOK
> =C2=A0 =C2=A0 =C2=A0 Product Name: Executive-14-UC2
> =C2=A0 =C2=A0 =C2=A0 Version: Standard
> =C2=A0 =C2=A0 =C2=A0 SKU Number: Executive-14-UC2
> =C2=A0 =C2=A0 =C2=A0 Family: EXECUTIVE
>
> =C2=A0 Base Board Information
> =C2=A0 =C2=A0 =C2=A0 Manufacturer: SLIMBOOK
> =C2=A0 =C2=A0 =C2=A0 Product Name: Executive-14-UC2
> =C2=A0 =C2=A0 =C2=A0 Version: Standard
>
> I am happy to test patches or provide more information
> (acpidump, etc.).
>
> Thanks,
>
> Kinhelm=20

Hi,

can you please share the output of "acpidump"?

Thanks,
Armin Wolf

