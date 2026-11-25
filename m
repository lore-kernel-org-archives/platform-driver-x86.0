Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629810;
	b=zC7lYAla33NkGNJ1mOBfFln++lujLvJ7nb/ZzlcpkuTyhlDfEbaWvhPfqlmHnUTrxE9X
	 e3H4aDgd50dXMnL6zIyjkxqzr/j4abc/BefdQ7S3VWdLxyhpdQkEaQWi+OwP/sl23n8St
	 FRoVpc8hwt8O/Mp4FNTaoSOqKsma7iNoljUKiF3SY2IWxIj2wKDyeK/AquSZkjmqzC7OO
	 5PYRv8mVEzM4AWJ45cU0LlLKdur89/02LP+Uo2J46SruzrVP8fUadPHw9gW02thYZpg+r
	 QBaKYB4ItlG0zcaatuvbjuQ0hA/3LNuouNCEayrvrt4VkS6tV/VgyDeXw6rkrPv26pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ednzTerZKQHbSr9weSnkbZGaI0lxxyuNE/iWCwgD8eQ=;
	b=ZyE3aCBksK+paM1+ZsUTZ6qrmalRfAF6J58gRKVdH5VN3HnY3QfSHRo7XRJu1fdJk5ej
	 HbPL+RKahwXcjBdpZzeWwmKSd+MZ639JTNYl70YgR4YRU3y1YeyRPgWyUzeDDlfyMXxcm
	 0NbDl7gOAWOlL6WrN/LW6jk/VRN81ZoeHk44ynSuoOLZ0PrO6WmlYTEzvIUzuYA1HTwW8
	 /cgbDT6l83PqE8l3+Q8zmTnxtSvUSZQTXwxdMed2GxHJSvLoGoao+3bNngFJ7oi2zv1Xq
	 JTXg6tD5Gy3xenP0U/CtIz8gRLDxN/xhctGhSeNAZqWyz4gGtrgv3GdKQTaapfV1cjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Utu5jKWE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC9606A331
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 18:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AC9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Utu5jKWE
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67da564d9f2so8222293d50.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 10:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629809; cv=none;
        d=google.com; s=arc-20260327;
        b=kxCRXoxl2xywKnhrhdxl4WlIO6BCv59rxFWB1daBcLtTuh/leuBv2xerISN/2Cq+rG
         EdlP8MgtJtf1QsYG7PgTyG9umFL6gXxliLfcAKKt5dNu3FrkPd5M1E2uYuw7w4Z2twOP
         DIdCxAmMjFKPYgYxRaKtzpgNQFQ4+yQnzeiK8H5wOar0+u/hcSV3Wk4vOcbjhfjgHGUi
         uvf4bOWTWSHqBcdATXoYAUHqnOyztThIukTufTn8kwr0W+y3SezXfh2YUNl2/DxbZS+K
         AZ7MH4QhA+mS2urvFw3I1GjMHDo5HL2BDMdplbDCqLvJAMy0/B4y775QH4+UNbAP8ED5
         OPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ednzTerZKQHbSr9weSnkbZGaI0lxxyuNE/iWCwgD8eQ=;
        fh=5tpVPdfoNgfZ96xbsOUd8WOs4l+cFsOlQUlp/RCD9HM=;
        b=YWRxVuFTRg1LH+f2QFVTurtKvYabAK3oWHxus4kYGgj2VxvhyERHCkZBHdpwlADDl0
         pD5z0WZ3bt4sB2mQ/JJ7FhyTYoOzLfExRxK6RYOjMV9Ra94OztBAfMObRDCmbERKlXeF
         UxXfMFarsw6iDfjUH7ZWPnOm+bTtcmvqVrtC+4aqAmh+GBWITZ+8SwAziui9P5iuHRgl
         WUT0s9zeZvqFaI+Oy2+WKhbmSm9bcRYwgGbLs16wHctM4smaBQ4cOg2MdMCdxsO09q2w
         I2GzF/eTw8zPfty/5XflU+hIsnm+pU8p2v3x1s3/m1qbfhr8SCX0U5FxjE2jwhS8hjBv
         iNLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629809; x=1796234609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ednzTerZKQHbSr9weSnkbZGaI0lxxyuNE/iWCwgD8eQ=;
        b=Utu5jKWEGVIdW35vjoBuglbD4NrMX23BcDFTZcJWrrMJ3d2BRMRGAThzxlSxiCojHd
         q5uOLfCrMA3eZnVg/MCWfE+dUcrMUbMV4+UcpUH/JM9erURiXwa1ilXIJ1XhiC+Cd3s4
         txrDqiOiE4HSWH1wNyFf/pUWa3NxRHWxZiY/W4QWU6XzT3/ttNTKGRXAKBAWrXSYZd5j
         OGa1e8Fe47nAvuj8JR+afsvzSk/Kc6o0dWyQeaA2JND7UiumCEg/ZpnDcLydLeWosxrw
         vjNqhzym6IABNJBEOFLcMEG+jtdJQE1VRhi5j3KvkQpPfn7LyMwqnqhR9mODKxATSjwv
         oLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629809; x=1796234609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ednzTerZKQHbSr9weSnkbZGaI0lxxyuNE/iWCwgD8eQ=;
        b=IZPBEt0tkQ3c1cPA/N/+SOvhpj7AaABdX8vQ/vUmNQRAdidQqAm8DaVDDz776KHkpR
         mQTuGbOpSnKt1XZq3ahBG8UTByupWZ2ZrlhJMFnPg/TrK9Rvy8rGFoXahlm6KeuAFx7j
         kIur2/MCLSBNVt6uZN4gdWRbkxtO0FFWRXZ49c/pZZSYQ5Jk+PTojF2WJqm6Yv1Ecr9d
         gFSmXfjMEQbEZM/Sc2mpGOHrNaGs5YPXJ75JFB2WT6go/OtsEISoC1Q3BBq106kNI6QU
         5aSMstusjNjdjbfmJqbfz3YUyfo9OI/w/fvi4sc/JaRG4cT8nf28/ee7LEH6bfGzadsD
         seNQ==
X-Forwarded-Encrypted: i=1; AL+hErGp246D7NWfEcdtVWUEBrXby1aGCrOHI2HoLIP6f33IbilbJedr8jR7165GQ5yxVN09AvfHAU8VqTr9s4i+8j32vDlO@vger.kernel.org
X-Gm-Message-State: APuU4Z/FOiiRLOqkHsHr1/Ubw5dnbyYQOIQF86KO9Zf+0wABvPz0oUu9
	rx/YrzNRpjHJdUkOD9+5hvbNqyT8ViB9KOI/DuntFencbjMremj7OvjzFrKofzsF2CQdV967TyT
	5GLX+07yqk2DELLdlI/0mjt/r69//iLY=
X-Gm-Gg: AZFdTZdti5io1HKypxyL0K8JNXe6NusNH+m0y1hUvV0BVF9SIYM88UbCCr5RSp/uGCO
	yMetoqhCKBi+nRRD63072GnlFTrpbF6hRyp5Y5O3GwJDH1YlsOSZYEveH/39Rbrp1MpWnNWQasL
	cPTJNXr2DsRIlXMaEig6b21fLRwXEPundESesKShgMaHOFiVRdXnt4Rklefgop47UxDg806FXbb
	HGrXKKARPB4MhMspNYD41nZu3n7xxva0kyMU2Fp8n10WlRDzPxjAlkatRPOubigrzVNyFLdk2jC
	YgXa4XD1WnqIvazVTTW7u6VGrmoJI3GOH5H9weAN1aYZ4PoFlcq0hlkkVMDQawJ5Onpep1JU/2y
	hngVKnfaL4bsY+pSceOTQp6tX8fFcApym4dYe
X-Received: by 2002:a05:690e:4849:b0:67d:bd5a:cf4a with SMTP id
 956f58d0204a3-67df42d0aa2mr4895252d50.5.1795629809087; Wed, 25 Nov 2026
 10:03:29 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMnz_-Dgg2eCgZxcCaGuKPV=3-kCfg7ajd9w=vs2fGL-Cb6hvw@mail.gmail.com>
 <f1b7d729-771a-4fba-89c0-996a8a168126@linux.dev> <ce46d69f-2a3e-45fe-abe2-f643f683d09f@gmx.de>
 <CAMnz_-Dztuj3CRsxcVnfe2=OCB3tTJzK6Lu7-AKfkbuqn5N-UQ@mail.gmail.com> <DSVPR12MB66402023AE5250384B26515942BC432@DSVPR12MB664020.namprd12.prod.outlook.com>
In-Reply-To: <DSVPR12MB66402023AE5250384B26515942BC432@DSVPR12MB664020.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Riccardo_Zangh=C3=AD?= <riccardo.z.dev@gmail.com>
Date: Wed, 25 Nov 2026 19:03:18 +0100
X-Gm-Features: Aa3M54o3ejowZkwXNaB2whcv1q9ei4v9f7X_tsdIHarYRrDqpjLNLgFm4DNkp9Y
Message-ID: <CAMnz_-C02J6CznPD68GgWCPCWEDSGsq6hoC+AJhsZjw39H+hhQ@mail.gmail.com>
Subject: Re: [BUG] ASUS TUF Gaming A16 FA608UM: working backlight device
 differs between MUX modes
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Denis Benato <denis.benato@linux.dev>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "hansg@kernel.org" <hansg@kernel.org>, 
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "luke@ljones.dev" <luke@ljones.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 07:13, Daniel Dadap <ddadap@nvidia.com> wrote:
> So, as an experiment, if you could read the LSb at physical address
> 0xFEDD83B8 in both iGPU and dGPU modes, and report on the value, that
> would help.

Hi Daniel,

Thanks for the detailed analysis. I believe I received your full message by
mail.

Result of: od -An -t x1 -j $((0xFEDD83B8)) -N 1 /dev/mem

integrated mode:              4a  (bit 0 = 0)
dGPU mode (gpu_mux_mode = 0): 07  (bit 0 = 1)

So G40C does differ between the two modes. I can try the DSDT
override next and report back, or test any other patch.

Thanks,
Riccardo
