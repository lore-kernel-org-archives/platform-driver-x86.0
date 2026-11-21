Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287749;
	b=reyieQMUXSzoZ7hKHZx6LEbypetdYB3zzji2261+9/b74G6g2NlgoUAth/PQe2Zq57XL
	 X+QH2hQRQnEEo8lnfWbm8iUU7HKVhaQt8CrgOh+jpm48Dkiidzczdf17Ij54xBmDJGiyt
	 Q597p0NpPLeEtpN4jDnhwJC0irlHcSTovTObxacSY5LXz+Cfa4t/RR/UYBDkG9iFFPVbJ
	 /ots5DOtSioPv4cW+3Tp/NhoqDZjB5nJhXMb15BigsI0pQeVhMaaaJ2uZM0/wEc4d4THX
	 JtMaMz/Kr59Dwp/S5nKR81L0T93/8aKbXfznr7qnq14OkI4fLyDCppaJkLm11OZ/8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
	b=Z8h7dKLJxkdieoFG+obMpuzrwqPCsaPTNMeYIEfm1OBDCXhhtwTVcrRigfpuqC5JBHal
	 JKYB4DV52DCGvbxia8mjfPLWSUvJIgzFw45WgiZPsWc8r7+/NdwqkM4B2HrqcNtZxsyvK
	 YtFUO/7uxltMTMkRzTH8TjjHXl1WGL3sZwKCefWLW228XSMrPiYzJJDXFexzW8qWcOSWs
	 IeeIH5i8nbu1XkeEdopnf+czOriNw+z8zzHRG+z4H222QQBDJ7kPVuLW1ZVzAaC+hD1VW
	 FW2J8YCcTuPOQGtIuRupWrtIQPCMyNMXxlDE2pE4z4nXx4HX2lKQQ0ketY0283oCqQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCC606A32C
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBCC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921367ef6b3so14134706d6.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 11:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287748; x=1795892548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=tF0L4OWQ8diIx+BfGSc5Q27+DM9xv7zG+ssN6agguZg8GXUKNxOk/7p4/jJcSCCt2L
         vWMIEgiJZG1GdutpyeUCPGYhzouIPKFfhcMk6jhEL0nvyfsw5ybTJ4naJgl4pGSTOhh2
         cPjORvo68aZQtBovC1k2TesMjjyk9sQJ8DmTSiX8ZSxIHjHLkJ8tZ1KZjKss2/5m64Nn
         3hnpZLekEE29JzQtCPIAvvlOk4KQfFVt9P6A+4ia68AhL8EPofCK/AW94UthF18ve91F
         vIkmq7CCfF5QEjijJPXFfIgVIqeuQTkPTsoJjWp1LwsbozGMHrURGRuExm3PP66MLE4q
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287748; x=1795892548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=vOaOeKidrBFO50OwipUyiVC3mO4JI9fr+Tyer267UZJz3Vc4o5PJlteO9HRxiStxXX
         iDQFNuIriqbc8QY0FGIuNt8aksQXJbZNXs9sgggxYsNwDWxuqCaxYQeI7JvraAL/FNPP
         SO63vVolCjynpIGGaf09WIsJrdrWLYU1JKwxu4jf0gCo1BtSZHS6Lf/5vi2eeCnDRfqB
         PXYJ5FdnEnHzPOEjPInmJ18s3+fY8RyIV5HVgX0XW4xqkZzrxFOnYVfqRW1MVwbZyxWx
         u7h8QCZx/IAtz6XZXvs/EUOYP6qe85vm8muIxBDi+sFGkf4OLfWVOYEgtdhcPsC3xj8T
         4nNQ==
X-Forwarded-Encrypted: i=1; AL+hErG9UZQk71Wk/mfAdv1mLHa5HAqlWqhNXFrP704wgkSJ58SASw4Q04t7ATraE799D0QHzc8mXzG/bx4wtaQ7lFd3opOE@vger.kernel.org
X-Gm-Message-State: APuU4Z8tGEqY91DHbv6MrQA4EPBAyLFt+4BRecjopqo63HSXXTJKjzG7
	sWVfadC+85HRxPf8hWsmvX2RsZvJ0z2GrfBDCipA8FGBUgs1Sh4K9r/f
X-Gm-Gg: AZFdTZc4KImm08GnIxPqZElMCA1aAFtEuBzlxJ3zTl+k3WU8+78K2IbQISdyVGAHg8I
	+DYBhpFwnKeMFIaUEtPFy7LaKlUcEnHpZnLmsuEsa/pbFyghINF/7387NTiidp0hiUsqORGvgSr
	veqh6vKKIM8cmmacpdSbWHrmuavRjtBzgsLU6HKRANFe9K4Mb1T7LiZv/T5ThHtWGkoysSZD+Dg
	/1M5i+w5p5nN44MuaMIP8dNY5FCRb3ezUrF+ZlSDDgO726DU884Y6VUIovH4RCTxYl+wndslJvd
	rpqErlLwZq4uAmdIbzbEYMe6HzGnfS3A+9YkkxkQUxuB4Y/SJwRO6Br+iE/ulT4KVcxRtR/y3Ce
	mJsvXh/ARqBE43czrrPB5L2zXZ6PJEwvYtUZ8+eYGVDIjpwLUlfTYdsfQ0g6rDiHuOXT5iTpNqv
	nHYT6UVR8TefvDfg/ueXlUFY7/XvU6Izv3C2dpueK2triruSwAGwMUQIzVA0KPChqY2yDPvqwfB
	QTm+lqiqtQBWlu/tPEuVxzLW/hDSywvk0Mip2DVUXNE+8HAxVHCquDIPukXXDx5WMKyZffv0GJ3
	4FSJU1RSTH2DaieFbIwjHHW6pFvnghkHmMfwRadYq12Oc4sJp6Tzjq7Q1sZKfCZFtGLnIqTdTwc
	sRzWyx6vhs7JJJYLXr16Pyi/diD3CiHjfG5u8rh6k9/tEpV1r4bWV
X-Received: by 2002:a05:6214:4e90:b0:91e:a629:ff9b with SMTP id 6a1803df08f44-92134b48e03mr101782516d6.52.1795287747625;
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a15b99sm59575286d6.38.2026.11.21.11.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Message-ID: <6f70f43f-4fc3-47ee-802d-50ebc0a8394f@gmail.com>
Date: Sat, 21 Nov 2026 14:02:25 -0500
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
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset
 GPIO handling
To: Sergey Lebedev <lsa.uz@pm.me>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Jakob Berg Jespersen <dev@berg.pm>, George Neacsu <geocausa@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 5:02 PM, Sergey Lebedev wrote:
> The driver assumes the sensor is already powered when probe() reads its
> chip ID. That holds where the rails and clock are ACPI power resources,
> but not where an INT3472 companion device registers them as regulators, a
> clock and a reset GPIO for the sensor driver to consume, which this
> driver does not do.
> 
> Request the three supplies and the reset GPIO, and sequence them along
> with the clock the driver already looks up, in runtime PM callbacks.

[...]

Hi Sergey,

Tested on a Surface Pro 11 (X1P-64-100, LCD, 5G) on a v7.3.4-based tree
with out-of-tree CCI/CAMSS and SP11 camera DT nodes and George's DT v2
patch on top:

- avdd, dovdd, dvdd, clock (19.2 MHz) and reset GPIO all come from DT;
  the sensor probes and streams 4224x3136 at ~30 fps through CAMSS and
  libcamera 0.7.2;
- All three supply rails are off when idle, on when streaming.
- v4l2-compliance on the subdev passes 46/46.

I did not test system suspend while streaming.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng

