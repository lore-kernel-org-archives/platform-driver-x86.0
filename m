Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218840;
	b=kxJw0+wb4OHQanSYc59/0pNOKAZnwLIluaqmg8W1CEEaID20Fuhpatq6SmSudjXEZIWl
	 WNzv9msTheCpt3sMl3yE/m3gFKaINBTEDezaltoDg8dqX43kfaoit2JiIaB1dXt1eT+Xh
	 UQSbmsMpLmqbamuOEpuqRL/TW3r9ezaF5oqkpilOTkF4mjvEMrJox8qAHWLn4rZV8Jzcl
	 2F3qwvmJNgcP+IBcs+1nCMZo/Hb2rt5Nwao+DprqFK/fUF778TKhyKIJL4bzAT9PTai24
	 +GsyjONHcu2VZMACb5vjTFnoSBEu20ejZn1rYpDOYANX1hCLr2Y376irz6ZzVu/S/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
	b=yIJLx6DNbsi4JtxLosoVGgvPAT7ycLDZk1g+eMRB3OTiSEMGDYX5eg8vSSzUMAXEgtmK
	 uVcmZVlKg1dzn79wpztgDHWnFBcnqAdvD0j2iFetYKv/OkgGI+nfF0vMLeZNn4Qto/4E8
	 5URweTV6JM5n+BpEc+kr0lThdWcNwr93/1mOGVnZQcUU8yigw6+K46sxhs8MakSEKedOl
	 GBP1Td3wFNZl8H/K0Nbwx8AESR9bDt1zo6koQp4W5E1hiHKG7emcy9TSEaLsNdWMQiU0Y
	 rljX0oJymZEoYRdz8iAHEvHSXCzFVY5O+V8GDQ3tDGjktIXXr8dizWWWPuweCCnevqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNcDsEvn;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE3606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNcDsEvn
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1200576eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218839; x=1794823639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
        b=fNcDsEvn+lk8+6n3myzVJ6BdVdvuaSs6h45CsXRdXS6XzaprD8Mrq43aFqR3p8r2Xu
         0ucwy8rpmdDe/hVwSPEPKNprQ9nZ3bg8ceYTWBUufnAqlq/cK3Ogwa9xGOugN5AfOP7r
         cZB/73WJ78JCryZfl0O3eB9HFUj0xd13t1H3B1hwE2OFvz0P/NpCmlKK5eaR9g1pRjfX
         visUCM1mPBjAdm9AvFePCsx+8HCL5C8D0H5Ti8o2rjPj7RgnBqdeyvszBH5IXCDLWkw5
         VtyQkJCJpd5OCm49nXjEPAMD8benLguFq/zFKHPDP3MjbXW4km/TMXL4Lq/FeO+iYp+l
         MuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218839; x=1794823639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dqc53VlCp3+UhG9y0wXxgHC6vxpg2u28zRHB3WOQFNo=;
        b=bjKyCMnQtnEUThbU8SNv2eKoYjZxPZ5/1NfXizYV9opqHtikGMAn6Eze/0OLEWeZSx
         hMsEQGTwMiID6WVPMVtBzmdVeXlcXHDgXmlqZEDNAM1X408dxhaXYPuDTzPipm6H5Apy
         yWw16eQYkxV21TLYIXvhJz5YiHHcOpUIK6FMLBL+9jugRETwlj1fzdpFvcnfwLnkNZhv
         +nTF9Qt2yFSwOC5hcVSpp9vLF7lq6SaMXH/4f2q+L/umMx3otFUzNMQ1U6ned5lGFk4R
         ZkgRsba7XahALyYQ2CooK864NcsARxqTJC/ZPmo3CTl2f3hnqPDKst/pMt45FVXrF24M
         MsKw==
X-Gm-Message-State: APuU4Z8VO8WCxLVD1nyguLP9Ql/zhkK33gWUfD2QTJCPkqFKHXv18b36
	vEheqQUUmorv2jPr4MXSScBJ7rOZuj0Vk4l/J/dzJgsYIkYI0TRV/1Jf
X-Gm-Gg: AYBFou2y4VgB99aSjUgHgdZ4+TJ4D7WihZ6M4ti8+63yfiFpHGVeYLHMsP06zG0LTQw
	ZGwGrpjWWRNkeHNnNAoMRJLS++kkasG14hXEC34xXXLZVm4lbrodR0EF1Vow7A3u78JOMJdCHao
	yxXCq9GUekRVy8e8gvZ+ze+/eA1R8hwc5DeicQ2LY5RCm6G3MqNxq3cgPk31aFpQBB8McT7Ryr1
	dJB4kfgRPN0JEYt4WRXCUALSTYcKU0xT8t12GH9mO+7Lgi4fy2I/pFIaesc+keBjSkmKSKYks04
	L44YTIRg06YOjn1DSGpLMtmxIwljkA4l19T8ap3wfjNotjt5pPVvwBQFacRJxmKfI9o/BQ7wZGk
	5NdKDG6vSs6vQCQTosWUzyJwj5yHFIYi2795CTX0rBR2CknKDpPAMO4YI5fBdMKm5uT65e1Bh1q
	aZt+NHaUbBIxKHfUBx2pjuf05XcKzGju43CvI2+dZSe1MSfAkFC89YxVN+GdbfMvlciFelTLztl
	C3dshsB3qLm8Z4o1Au9blkiZpMm+fM7x3UJaCnP+NkL/DG+T7Hrgt0gHxX8y1urlxbu+A42ZMCj
	RZ2L3P+YPcW2PObYNnsCm0Yh7uNezJtqugRSYGWYNZ8ehF73Tul6ZzPLhSEigjIrgiM=
X-Received: by 2002:a05:7023:a4a:b0:1b3:a89c:c456 with SMTP id a92af1059eb24-1b3a89cce8bmr3399268c88.6.1794218838912;
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:53cf:9f18:268:d90e? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm11600527c88.9.2026.11.09.02.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
Message-ID: <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
Date: Mon, 9 Nov 2026 18:07:14 +0800
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/26 23:40, Олег Рыбалов wrote:
> Same model line, different board and CPU vendor: I see this on a
> RedmiBook Pro 15 2023, board TM2209, AMD Ryzen 7 7840HS. Adding it
> as a second affected machine plus a few observations that may be
> relevant to the quirks table.
>
>    XIAOMI Redmi Book Pro 15 2023, TM2209
>    BIOS RMAPH5B0P0909, EC 1.9, USB-C charging only, 100 W PD adapter
>    Fedora 45, kernel 7.2.15; identical on 7.1.8, 7.1.13, 7.2.7
>
> Same symptoms as reported: performance and balanced-performance
> return -EOPNOTSUPP while charging, low-power is accepted but reads
> back as balanced, and --block-driver=platform_profile restores
> working profiles via amd_pstate EPP.
>
> Three things I have not seen mentioned:
>
> 1. On this board the platform profile does not track the effective
>     EC power mode. The budget is set by the Fn+K OEM hotkey, which
>     cycles three EC steps. Measured at the package: ~15 W, ~35 W
>     (the state after every boot), and a top step that bursts to
>     ~65 W and settles at ~54 W / 4.4 GHz all-core.
>     While the top step is active, laptop_profile_get() still returns
>     balanced. So relaxing the AC-type check alone would not give
>     userspace control of the power budget here.
>
> 2. Ownership of the event GUID 46C93E13-EE9B-4262-8488-563BCA757FEF
>     flips between boots on the same kernel: some boots redmi-wmi
>     (input "Redmibook WMI keys"), others bitland-mifs-wmi (input
>     "Bitland MIFS WMI hotkeys").
>
> 3. Writing 'balanced' to platform_profile while an Fn+K step is
>     active is accepted and wedges the EC: package power drops to
>     ~9 W, all-core to 1.0-1.1 GHz, Fn+K stops switching modes, and
>     scaling_max_freq stays unchanged so the cap is firmware-side.
>     Only a reboot recovers it.
>
> I can test a TM2209 quirk or any patch on request.
>
> Due to a language barrier, this text was prepared with Claude.

Hi,

A short tip at first, please use the reply all feature in your email 
client instead manual insert "Re:" in the email title,
so we can keep the thread tracked.

Could you send the acpidump (from the acpica package) output? Then we 
can draft a quirk entry from this.

