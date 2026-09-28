Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945615038F8
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638000; cv=none; b=kecp/gwRPxmeXS8eVQqoL8AXLGGDZr3DPwVDmRWvLzoHff9wY84k3YYz8woF+TguOXQO2kuZKivz+S1Lz+9P4wVxrExvCNfNjeZ00Ljpzq0kiIP+arC7BrPgCGsCbqKXmTYDa+WFPWxsnfLyeNiFnJ/qjo6rSq01S5qJedeQv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638000; c=relaxed/simple;
	bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa2xuwIbRC3tv4YW/rEE2IFry3F+uagYRd4RHJd1Jqk2aRGhA2woAYWx0gXDOo65PEEl6I0odHiHMtTqLw7gGKMBbOwnYjFdRm/Lq++QNLbH6IGC9btCoBi2LkOpFPHgbcv/586GghrqXlvtPOVqbuAbUZ1SdWsU4UC68U42ggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir+lmguz; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir+lmguz"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cda985b0f5so1173772e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790637997; x=1791242797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
        b=ir+lmguzHOe9JLjA1c0mRFFY2lST9x/SCwugLMptIJ8xoYqfRNqd8OWalaMtZc6nVP
         NeGocSbA8bsvif7kX4+RirSeUpz7i4nCRksdkFNdmvrlrIswS8FclATXr3VL1SQCAM2K
         YQNA7WuHiq8BMGNGKCDVO30NXD4lwHqJPoLHWbX4wyLtbmIT/ODG/Bl5T39B9DBccRPP
         QuLrYmWuciz1uk8px+OElDoJDGeCUmBo1Nnct2j1fnryEDIGvpvjRYWbXUpUaEXUTOEa
         HZ4v72RHQovqSVkBHqM5LbiRdvYzm1Y1fVS3JIQTs0gvFiUtqkLPscD7fqVyA3TClS57
         TWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637997; x=1791242797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImnVREnlEeFJR7B7Mod3ObpgEIQ6gLW4hGB0JEWUNA0=;
        b=R5eoVaKfT5vY4hVgIkUhXV7WbV/6/iPgR2AlyldiY/rmK2A+I0QvRd9mouinSScqvC
         sTa8xm2n7rFrBrO2kCCEeiRUfVO8EHA6c8Y7JB9TFsQaaln2I75LNMT5e7m4iAUFNME/
         nTAXqVVzRG3ksO5cJnbuPUiwcmd/4M2pZ9AsCn6IQzleVXdC9j2JTUnpkcyr0ZjN78bA
         5eukVEoQqyI9AoWa+A9pgVt1NuZTVO8W4cqVBTMvr5xSV90/k5hBoL6kSKWBxREgnTwQ
         RW3x2dHausdrr/KDELB7FWtC+Uoekc+Xr4bNDcLfqSGVraQwLGcJiSPiUsmOYg/djnLz
         BqVg==
X-Forwarded-Encrypted: i=1; AKwUvBxwK5sz9GAaThTK0Z2iB6V7sBC67yh/p1yu3O23n8gjEDL6KmyYIU+qNXRn5YdTNKBVTq/lsA8AJgbfn9TNcBewZMIv@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0QHVgREWJlsaCFevC/0jSovzLI/k3wqTLxAqHn9nAPa1nDYYc
	UWOpWG+3GiGDRpx2UYuPLiurXPgZzHO2kIXcPiSwisjrfN0nYlGNhanF
X-Gm-Gg: AYBFou16n/B2DxyvQ9PKeyxGy7WRz7pyWf7KkmGSXE60lItytcYw+b2ZRlFUwSDuV+i
	oQP7pn57OUoets+la/oGa9SfRvhYd+l468uqfPpQh+AcsH6WCy+p2Zrni9GF/0cqpe5bTo3/j2m
	w+dShOCZpYqKdhj3y3aMeIQxtvRst7e/8H7+0z+mUPuF41jut/m5Wjr93Orqe6d2ZFKkcQGh3IZ
	MoccnpGaCSBBLf+n0CkLuS6kXCbDS99QFs+pobxUsNGCda3goBMI/z4NvTPrgpKO62oCxhNzWmw
	pZDziwEw8Pak0aeYGH8xxd8p2ZRV+pi6rC0TB3MPg5l88dJ4pZQqnEJ4tLveqzP47OKpkQT4p8t
	G/it5UKo/DoA3KrqtIVTCjEu7a6qXYJAteuMwxpaR2K8HM7sQMraGX9PwE3m/Wk9nVtNCNcuplM
	yOrfrUnWgf5XnhG3HGWvEFv5J14IN0lN+E1kjvWjHEnlSAE7kJjSlgcumPnrv+i7mhr541H2i29
	k+nD+qLII2ydnM7HSo73AXysHETbQPxmkeubhQNsFTPmox0quCLjivi6ve0h0lr
X-Received: by 2002:a05:6102:f0c:b0:7a7:198a:c2c5 with SMTP id ada2fe7eead31-7b1d74b3a82mr2945563137.35.1790637997372;
        Mon, 28 Sep 2026 16:26:37 -0700 (PDT)
Received: from ?IPV6:2803:9800:a0a8:8014:618c:a663:bfd0:635e? ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b159055sm11172269137.3.2026.09.28.16.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 16:26:36 -0700 (PDT)
Message-ID: <595cf557-e386-4ca3-b8ea-2ce7fe160018@gmail.com>
Date: Mon, 28 Sep 2026 20:26:33 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: Chris Taraszka <chris@miget.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>,
 Mingyou Chen <qby140326@gmail.com>
References: <20260928153902.139956-1-chris@miget.com>
 <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Content-Language: en-US
From: Matias Civadda <matias.civadda2342001@gmail.com>
In-Reply-To: <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chris,

No problem, your proposal works for me. Please CC me when you send
the series so I can test the shared changes and base my TM2107 v3
on your generic patch.

Thanks,
Matias

> Thanks, makes sense.
>
> Matias, one thing I ran into when trying your generic part on the
> Xiaomi Book Pro 14: its values are sparse (0x02, 0x03, 0x04, 0x09,
> 0x0a) and 0x02 and 0x0a both mean low-power. With a profile array
> indexed by the firmware value, the unused slots read back as
> PLATFORM_PROFILE_LOW_POWER (0), and the reverse lookup for low-power
> finds index 0, which this firmware ignores.
>
> So I'd suggest {value, profile} pairs for the shared part. I have that
> as a standalone patch on pdx86/for-next, with only the profile table
> in the quirk struct, so your response layout and AC check handling
> would go on top in your TM2107 patch. If that works for you I'll send
> it as v2 together with the Xiaomi entry, and you can base your v3 on
> it. If you'd rather own the generic patch, that's fine too, I'll
> rebase the Xiaomi part on yours.
>
