Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879590;
	b=mSlpI4WMNe4cQe9/DHiUvgX/Beq+ZbeG4R0LSNRw7GpdjEZzWU+nccQNPLdQzjAGUyQh
	 zgcj6zUfqSKE1iBoGLvXjjFtm1rEHl66XeFwEhibfFBITYuUZ2mMd/2S8zHDzPmmYwE8+
	 BG1wuRgDkU5aqHuIgbof8P+xK+xsEgilZ7RPLqqsstPu5j09uuukp2CsCTjH0c+PHShHt
	 ux9WBsI34Mm62Qs39W0FFIAQ/CQ1hbtsNRT0sjucr/hW5caHPu8JwkWU3Jzrm7g1bfKOZ
	 Nj8gjbiJxThLcGCMc3FmTz6QjmUDfh1ZdymLEWM22vxlUkkI6FdORjhEoVhVmRYRa7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879590;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=q31Sl4jkoB85ijQ/mmWLVnovbSvmAwnda2ZtOHO9ji0=;
	b=P2Neo8oHin8WUbUMj7SysUnMIUqlfRUZYXJZjmv8GWVEqwz2OSWugnM0IE4wZGIVPENN
	 RL35zMACuKZf2LQGC1KDLX1MQuqbVhcBsQESkM8j3Yn5fBpRg2lBnYTyA8vXB4mY9SGQ+
	 uFNN7PfvnAmfpkbyBiQbSur1r1TOnMTOQ4c9Er5QNu77JdeKLG8kdokvm1tFx8vnpvaB8
	 9j8EjDAy+oh+qds82pQGvWdsdWqjnC8oKVQRl8+8p42Pl1nl3p4SckFBQ4n6SgqOELPSr
	 fqIk+/hvbeU8B8h3YYEbYvX9eDBDpZrRVF80Fj2Be7IYPOFXM/p13zfAr8fMo3wTr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=o7J5VgkT;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537AC606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537AC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=o7J5VgkT
DKIM2-Signature:  i=1; m=1; t=1794879587;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:sbR7XypqiiyW77gT8O30yeHxRcuZ
   lmc+d3nQuGVdXMaw2w8zFyqGDhYEKAl/uuQvbVSDErSBqtyqnEbQ80rSpb7BPekQGvFBm1CCWK0
   fgZOHv97hUxYDc++J4Gy5nWWJgHCMJ28GDuCr253TGcIGPQDOBDAdYyxiTN1kQdVhyxl0GeiiWg
   uHmCGngu5+l0m2lHx0Zl3kk6OLzCMsRilGucDcVwPoqTh/2cXfKoBNzweoSMbzVoze+fnu+NiWz
   eMIaq1c+c89bJITotO7JT5dguG/62BxEOS0fjgL1bYfy5mJjK0wOU2XvR07562tDgpS856AamaN
   devVd1YGMSp2PA==;
Message-Instance:  m=1;
 h=sha256:
   VjxHfmKkbE/E6pQjsGiEvpIFzcKK4Lv6zzIhY469C1E=:
   q31Sl4jkoB85ijQ/mmWLVnovbSvmAwnda2ZtOHO9ji0=,
  sha512:
   5RQ7orvdfqNx12VVI+dE05PYQZPLrEZ0B/NwA7+81IHIquNOPOQvFoRgdajGvtlBiHr5lbF+5poKUkDC7HQO0w==:
   hDSvQTqXQVq2G4Ips/w1TC8gR87TQCQCkPM39RxSJWoj6N1/ebsUDu3hfGoTrSp2nLRBilGck18jNwWZSunjUQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794879575; x=1795484375; i=w_armin@gmx.de;
	bh=q31Sl4jkoB85ijQ/mmWLVnovbSvmAwnda2ZtOHO9ji0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=o7J5VgkTrrobFFfTyEeR9N+kab33xzSfAdx73xZofUh98D1CqhGEVjA14nbhmNL+
	 6WA8baL/vdc3Bbirzn+nh/WZW5Ua7aqqss5fA/ahKIl4RyWr1Q/8RFqZyqqAWHIRu
	 5QFFjr7SSJ7QexbnloweiokWJfVVLVT50gaGzmA0G65Uw1dAtpLg+RkrLILZDTuvG
	 UD2Glx70pAz3OUk+4KvV8OdDL2XOZI3QMFDOSO65tK/zy+zW6knQJTWspoBNXf2nN
	 RUvjo5Ih0c39lW9q0JIHb2M+6Wf62zxh7jFMRUxRClrL7HFmiD1fLqLRsEo4YIpZI
	 /xHb5F6+tpDl03xoAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXyP-1wwROz466J-00RXFk; Tue, 17
 Nov 2026 02:39:35 +0100
Message-ID: <946791bf-5377-482e-87dc-ac5976eb8365@gmx.de>
Date: Tue, 17 Nov 2026 02:39:32 +0100
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
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
To: David Cemin <dcemin@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Jackie Dong
 <xy-jackie@139.com>, Ike Panhc <ikepanhc@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <ldemarchi@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <0aefaccd-3c9c-4970-87f1-a329416204a6@gmx.de>
 <20261116044237.3760227-2-dcemin@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261116044237.3760227-2-dcemin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:6C1hBP6F6+/e/Wa/tUshyDx9uKgOdPsHIHlYBHETbK6Q2SQUtwz
 jnzfpCIEedfFBMOWqHuKP0rk+Agnmx1IRGf/AqoPeImWjLDfW79BX29BO4kwNISRNl2pC1a
 /LverajXd/xy4w4P7T1kg4truJVBtY9RmuV5AMtXfWkpi7G5J/WMbKWuZ2Kov7JXeJI5PLm
 SlAenZyOmULNUgCUrYkAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4LCExlPhrWM=;I8ltO3Z4FXpxjPXN/tfKgHBIHrC
 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
 fq0Zm/t2H36nSpsub3qOPw=

Am 16.11.26 um 05:42 schrieb David Cemin:

> Hi Armin,
>
> Thanks, all taken for v2: KEY_PERFORMANCE for 0x3D, devm_kzalloc_obj,
> drvdata set before registering the input device, notify_new, and the
> events delivered through the lenovo-wmi-events notifier chain with
> NOTIFY_STOP honoured. The payload is a single integer, the key code, so
> with notify_new it is a 4 byte little endian value.
>
> On the Esc GUIDs: the arm64 firmware here exposes 8FC0DE0C for the Fn
> keys but neither 26CAB2E5 nor 56322276, so the new driver claims only
> the Fn key GUID and the Esc GUIDs stay with ideapad-laptop.
>
> Thanks,
> David

Hi,

i think that we should still move the handling of the Esc GUIDs into the
new event driver, so that ideapad-laptop is free from any WMI event drivers.

Thanks,
Armin Wolf

