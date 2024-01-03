Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8DD1D521
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jan 2024 19:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qrTZQ+EK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1704310533; x=1704915333; i=w_armin@gmx.de;
	bh=4aOPEgYdvI2YtsRamc8qxwrUn0JFFoMkITvR+rpFGWg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=qrTZQ+EKgJOkzkKVAD+3KLmoIbD/yA4hzAuzRXxGycpHCH30JoqG0QkLEALJMF1g
	 bHtrwUKKu9Cr3hGyEaDE9V1MEzyKukwEvVK5TenJlq5Zjq2khaNJQpf1ft2ps1mGd
	 VizOmvMJ/cm+yiQxGTXIxlL4m+Fq48vyzKPDEZZdrN/SB7Qq13tSxIAhT13E+nW7U
	 9x7+fgJYi+ELYAgXl62gDyqZE8U8sj3hbCdw7b8kgAx4Yh/ylh/ZBjlHy1RaFrVUZ
	 ACGZqMAZSd7HR+vYgBjJ4L/O3ZnQl5m8lX9JZZTpiWh6DJLU54M5QEkPYMFX3jwYO
	 BC2J9v+N9ak7op4izQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V4P-1rDaR81183-013vNq; Wed, 03
 Jan 2024 20:35:33 +0100
Message-ID: <13fad62a-c82c-45b6-bd78-ad51232dbe14@gmx.de>
Date: Wed, 3 Jan 2024 20:35:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ERROR: Writing to dgpu_disable cause Input/Output error
Content-Language: en-US
To: Athul Krishna <athul.krishna.kr@protonmail.com>,
 "corentin.chary@gmail.com" <corentin.chary@gmail.com>
Cc: "acpi4asus-user@lists.sourceforge.net"
 <acpi4asus-user@lists.sourceforge.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <GuvjyxvIK4bJrayfrvuGPORpcPhPT9WFxxtQ1nqeEyamn_po0WuVInoXQVRmpwBQkW9K0CCwDqSg6kXPEI9YTlU0LQ_FtIMmpxluOirycpw=@protonmail.com>
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <GuvjyxvIK4bJrayfrvuGPORpcPhPT9WFxxtQ1nqeEyamn_po0WuVInoXQVRmpwBQkW9K0CCwDqSg6kXPEI9YTlU0LQ_FtIMmpxluOirycpw=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f93Urp/xupwYL5Vjl1nYypYm7PUxSdgnae63kdJqrGHe4b19hGK
 2gIRuBYVKZ/2FJoVsfqQHZHKawN4ju2Ln4sx2gKzjRh+CUhWBkoLHSA8GpJVWtby3NcHGht
 w4v3cH43xJIa4h7k1dk/kV/U3zW0o0ik5WHgrsElHhn5CK0s5HIwmK/QKzPq0kJwAadl776
 MqAdwObQQsORdzCTrzF3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:21DVU553YWc=;BfDrSeUbCgYwpgV2Z7c8Oxv/pBC
 r2rLai4GJ47XC3NYwmxjoogy0i5PmASSU8BVC31vVbfh+8WCaYhrF+D49/0+uei5jzHM5XeYm
 hT6A6rA/HqcHQxhgchtQihlK57lRLVx51umcTO2MOHh2SW+p3exmzdUHkYB6bynEURbYi9GN3
 O0bWTR8fa9Y0MMqJ3GV4NcXgRN8r4raYjI1AiMXgttjF8wOMvZXPBjuS1SBJIBAYLNvFlhcxv
 Vq/b4JorAWTb52H0lMTZHy/whKntE/AKI6F6LKzcX2ytp0LGvSPMS/OrxC1pjMozGBQS/fHkw
 g3esgWEK0zx+EXgPr5hlRVN5eCHK3xl0EbrfI4TRfOGPFF0GvrEjNQgPxjAIlyiyNyZG8GDil
 69nGR5rWJXSJ3NvSgL9gjYAqWKsVs3iQT4cf1QBDFsuaYHImajQ1ZTVv7c7zUlV6bR/Sgi2hV
 QICSW2RnpiJsitIvO6FEuEVEmQKpY3BEuzu3ONG0DMwMnurEencwK2PFHZfMXZT5F6iJ0G7sR
 ViBUA3dSxAstjq7wIjL6wKf2p2lO4WFrZXGcNxlWAbW6RGH4Fltl46ql3GpzfWsBTAzwfSopa
 FZGtyoWi75P2e2nTmUQ/M870RB6+IM0c/w2IA5wX6wJdfflKt3TT8xlo0enRxt0wkgg+EUykT
 fB51qQ863fngbgq1B3b/oiX0ncOm0R6OU8lFyneKGvj0FVPsp2oKRBIW7Gr4dBqlBedIMQ1IC
 ufN2UmX4Uke9cPOuwmw7mvW44GB9LEkt2umTZAufCyt7NluxisfFhMMrWA+daEJLokJR1RiLI
 08bJOssEaa4ATGJkV/v85myJDL4LcXxEWHW5HK+R6mzr9n9fTrSWjcN9cAkyPiKRPqReCPmjy
 VwPXQFio3BtGGJ7cENO8X4mOOMDUJJfneGQ4Q6a+hwfcJtuqK5XaJUSWcuePtxLHH3e/vCtK1
 7rbzsj53b2zlKM4MF5mSNzdEiX0=

Am 03.01.24 um 19:51 schrieb Athul Krishna:

> Hello,
> This is my first time reporting an issue in the kernel.
>
> *Device Details*:
>
>   * Asus Zephyrus G14 (||||||*GA402RJ*)
>   * Latest BIOS
>   * Arch_x86_64
>   * Kernel: 6.6.9
>   * Minimal install=E2=80=8B=E2=80=8B using archinstall
>
>
> *ISSUE*: Using /dgpu_disable /provided by _asus-nb-wmi _to disable and
> enable dedicated gpu,
> causes system crash and reboots, randomly.
> =C2=A09/10 times writing 0 to dgpu_disable will produce an Input/Output
> error, but the value will be changed to 0, half the time system will
> crash and reboot. While writing 1 to it doesn't produce an error, I
> have observed system crash twice just after that.
>
> *Steps to Reproduce:*
>
>   * Remove dpgu: echo 1 | sudo tee ../remove (dgpu path)
>   * echo 1 | sudo tee /sys/devices/platform/asus-nb-wmi/dgpu_disable
>   * echo 0 | sudo tee /sys/devices/platform/asus-nb-wmi/dgpu_disable
>
>   * echo 1 | sudo tee /sys/bus/pci/rescan
>
>
> After writing 0 to dgpu_disable, there's an entry in journal about an
> ACPI bug.
> Output of 'journalctl -p 3' and lspci is attached.

Hi,

Can you share the output of "acpidump" and the content of "/sys/bus/wmi/de=
vices/05901221-D566-11D1-B2F0-00A0C9062910[-X]/bmof"?
The bmof files contain a description of the WMI interfaces of your machine=
, which might be important for diagnosing the error.

Thanks,
Armin Wolf

