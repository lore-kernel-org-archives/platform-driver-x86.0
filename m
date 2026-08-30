Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B028F5;
	Sun, 30 Aug 2026 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126127; cv=none; b=fE0fIygT/dANmB6HV6K4xBwA5dIIkVFb40+GwEnSrs271f1W/QHQxXbku1IBvA+CoXyi9C/cGJxPikvpBMaLwlapQmpfHw9vymmBM7VtqHieyR/n/zFd44iHySDVhw9FLueAJ2lqXrECz3avbR+gmawGt2oUrh3I/MSj8oU3Xt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126127; c=relaxed/simple;
	bh=muuSzfWMx6lwgnFyjEC8ojjRMF7bNH1CmjwU/KAzV84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxaXhUQpn4wkpnw5s9GsgTM0ugZJ4KHQtu5GzUViBXMLAK4NID/K0O5qcnCDSIFuK9L/569wdEhpsfUQH/LdT6FV33SSAIiKu3yZHaHMvCgkdeH9W+zs2jzqwzWSbTKMA2sBGKAZOHuW7y4EYHjDOsGE1ZIaXVzpIpvTQckcvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BBxxrPFn; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BBxxrPFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788126123; x=1788730923; i=w_armin@gmx.de;
	bh=muuSzfWMx6lwgnFyjEC8ojjRMF7bNH1CmjwU/KAzV84=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BBxxrPFn8HvcmCQfLs9YqQ1PdRb2vvY0LV2TkcAOG19fqJ64gfHpxOBzpJt31CuC
	 cMZzvfYy6h6UgDZSvZ+wMPopY3dW+aOd2wKaHB0rW4YAa2RkHcxMLELZ8CVjwL+uX
	 TUGtXqCLYBdDmZf/mGZi2jgjQGGpnKHNXlL6knlOoOwFXtXJsX6r7z2tbd7R5MX9R
	 JCOs24YnfZdyiDe4me9Qx8jsW0pIthqu5nKaBOmrHiuT6N/VPUFrVaJAYSVuMRFz2
	 KeKvJSvIHnVMOOnPWRR+AWn7QRcBIZsTptCXRfCq7Dmax4d8OSJpqmNTiXkMYGq1S
	 GXgxicHJqzmdPRd0FA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGNC-1xHujU3wlK-00VsEO; Sun, 30
 Aug 2026 23:42:03 +0200
Message-ID: <86edbe0c-21d6-4e63-bd14-8921ca866b91@gmx.de>
Date: Sun, 30 Aug 2026 23:42:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler
 directly")
To: Mo Jun <royclark086@gmail.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Denis Benato <denis.benato@linux.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan>
 <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
 <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
 <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I5kdvJGyknYOhUj/8vxO4X/l+YgXMSJICHOFdtc/t+WuJ1OKp9H
 VOwSNeTBQeacyFW5w2FDR6DgcA1OnqEKZ/Th/EG5P+r7M7dCwsmkBKQF8gIYQV38ITQQtEc
 8hn9qED7S5PopMNcKHKMqVFdOQEQCJbaHQZT+iI2vXpyRmTAZ422xAqHcftCcHIZtr3sao3
 TtXgkFfNslCvaDiW3Wf6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SZwJcN75N/0=;kmTOCg6rIoHiAo/g5D1t5is4Ftu
 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
 ICe2HF+Chzyv6D62jMM8fcA

Am 30.08.26 um 16:41 schrieb Mo Jun:

> Hi Armin Wolf,
>
> On Sun, Aug 30, 2026 at 9:26=E2=80=AFPM Mo Jun <royclark086@gmail.com> w=
rote:
>> Hi Armin Wolf,
>>
>> On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>> [...]
>>>
>>> I think i found the culprit, could you please test the attached patch?
>> Build the module with the patch(only "make -C .
>> M=3Ddrivers/platform/x86") and load the built
>> drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.
> I found that after rmmod the built module, it can not be insmod again.
> Also the system experienced NULL pointer dereferences in
> acpi_bus_generate_netlink_event() which may related to the built
> module.
>
> I guess these was caused that the patch only change calling to
> acpi_dev_install_notify_handler(), not
> acpi_dev_remove_notify_handler().
> After change ACPI_DEVICE_NOTIFY to ACPI_ALL_NOTIFY in calling to
> acpi_dev_remove_notify_handler()(see attached patch), now the module
> can be insmod again after once rmmod.
>
> Regards,
> Jun MO

Good catch, i will send the fixed patch soon.

Thanks,
Armin Wolf

