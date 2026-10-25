Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792954327;
	b=G85DILHTXRayU3nC8fNGRa2rKuERoFH03UqqYK3j9cyLiU+kWbJetR6lg2dztg253bqD
	 9nmzYGPuc9mEu4LHMXZxI8RK+LW13fQcXcvD4+s2ZpRSl8jq60tmzxRXQbOUvXsfacw54
	 xUxnFzZgMaqpU9ZZ84UCg5/bf+m12XnEMercI6qQXFn//pes9K1YjrPYwnW1mtBQQ2X4u
	 XDlGAAdrQ/NI8SS9+4rMQurARy7CvQZJmlXpmfo0z4J9pgmIW+U19F+oVgQVeCpDW0ZM/
	 kou+TXMqP34LpTv2cxRJkNxIuxuprQyP2BJzY1cYdqivkuX1hEZ5OgHq/p6CPgd8r1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wyaZ7BGveZumfF7hscS0DMRBRSSbSHRt9FPELcPqyEk=;
	b=VaQpa9ForrBiTC53QlDsS3ohx/KPQedhGfYZnl/bI5Zz5AyFgyERp/xZ2U0QxRrYeRN3
	 pO/EUSA6yNzg9CQp3l6jKHwx3eJyS8g9OAZqCMNDQ0j7L6tXPUgiyQC4PetUsHN1/awBX
	 K6iDeN+vJQ9BRWI3gzfze1jAvwTxmCJu42n3KNbahxWx6jRDIrb4rCap1zgrYkty6EWLq
	 wCpXAvPWbCcYDHjPwZl7Wz75boRDYqbaAkKV2RJ4ORsA5eQuk1TGHtnveGaEOBpSMbo+V
	 iIuXTpYVxt+6Pb1SBdKj5FLy73JwlB+oT9k+ze/VcusrLBqlaippFkERf89KxKCf7eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSNUmE39;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48C606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 18:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF48C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSNUmE39
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53634b8328eso15604261cf.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954326; x=1793559126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyaZ7BGveZumfF7hscS0DMRBRSSbSHRt9FPELcPqyEk=;
        b=XSNUmE39If1FuL56L0ck+PHzvGyU9hPoG9sZiFevEwP5bykPi8wx1Px43IXI1Al5f3
         R/0cHSoNaSA+SFmZNXU0iAiLRGhmDfU3beeMBJSFQGd75YdycFXnPdzN2NhaZG2Yn6x3
         3OvJ0ZlkSQMaShb9Oh+U2ioBxOagNmxbxYc+EWdqP+K0VBIOjrb2Ib6JZJa9TFPoR7c/
         /u8c7wTKqmoxVOHR+tB+6ACrSoRr4wXECjirCMQp4XzU/k82MBb3F5Vo69DGmTpFAcjy
         EuGpa5tkOg0V6esrhXGQ7ZaerM2NFh2dLsmtoVGryBE0ac3VCi14NpR8JIyHhh4eQmr7
         pmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954326; x=1793559126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyaZ7BGveZumfF7hscS0DMRBRSSbSHRt9FPELcPqyEk=;
        b=GzoK5K+jvkaE1lXaFGrPT0l+p0j7MSvLLGaNKoYpMOiUgljpkoiHSlLeACkMOak8Mj
         17kAPn4KJhhsD37G5ltFKq2gHC+JQnjqmNtn1/jgI2EbW62nVr8P6sziSDCUIZv6O4Zz
         hZBMGly1nH1IcL+NwsjtnQ4UfrLk55CqlRvYhSArQdo161+zMZHwB/nAQmdRsk422IfN
         86vLPzZqDjQtbrevX9ZmlrQaMavZznLayW+Ew3xWLtBDRvOXqvHecNnfPxWH27I9ioou
         C+xVzsnj+1+snBMaiKfm1w2MPx7HAbfhjYw3LdBpEEk1WvOEuqmtQBc+Fmdm4jjAuR/S
         7a/Q==
X-Gm-Message-State: AFq9FYJxtJfZPh2IJSj79oJ7Cn8tNj8dcKdLAq3urpQuZ0CdVu3p+HUc
	W1cQl6TxB52GjFd0/8TLzv4j6qZ9+f1SotvezGgRiZ/rbB+bxDvWKesI
X-Gm-Gg: AYBFou0rHBNxfpV0QxJib+7reQ7o1/TMAERl6gASiI8n3YLvhk7gFVXvXUBuDEYd1eq
	DSIzuI286fVyAiqZesa8d+q96ZeSZeVYGxSN1bwWTyjiaIKu3vTuL7V1Rwa2t/Ww29Y8LX/20QK
	eOToKh/kCuIhbQwK+sYqsLKB621U3c4OsnryJ0IVmHHlIo37uqB1fhqijUNIgWYlV0CVK5QP2NS
	Loj78rAB7qOpyB80yB5HPnmdjYVvIv1GrprV3hU3Aund6NIB6bSDiOn1i5P0k2ToS1QXFMFJxAr
	/yG4b7TC60jMvBvMJ5Gxlth4FR9aP9iAvnfNO4dho75DArHErv417uCebfWRnpGOCt89JJwCzd9
	k4HFOBfFUATlQboGInroV3Oob2PQPMbdpqtMRC+7gRcpc26edZNsg4UZDN7QqzzeSVTOF6amDME
	/MKm6tUK3fIhvkItngRxrbW2O1S9B9382kqr00tpRfTiK6C/el7tlLFIx0Iz7HhMC3GTxEP7yjj
	7FESnRb0ImTNKOs7ilJFtCfi99oPAjMe4vu5FvfDjEnAnRu7aYrt71ZgIftbV9N7bIqrnvVHSLp
	zteLVTutt3Tq5TUPXKoFFmpesIoaMWA=
X-Received: by 2002:a05:622a:8b08:b0:536:7747:3712 with SMTP id d75a77b69052e-5383b524fc7mr74981931cf.37.1792954325611;
        Sun, 25 Oct 2026 11:52:05 -0700 (PDT)
Received: from [192.168.60.8] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c54cbdsm51721106d6.26.2026.10.25.11.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 11:52:05 -0700 (PDT)
Message-ID: <a6806b89-8086-4297-83f5-b7824a503099@gmail.com>
Date: Mon, 26 Oct 2026 02:52:01 +0800
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
Subject: Re: [RFC PATCH v3] platform/x86: panasonic-laptop: Add
 platform_profile support
To: Wu Zhipeng <zepwu@foxmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Kenneth Chan <kenneth.t.chan@gmail.com>
References: <20261007190446.38862-1-alexyeo362@gmail.com>
 <tencent_7F39F02728B55CE3B1878AAB51BAA0FE2D07@qq.com>
 <2df90a2a-770b-4439-9d01-bd8105084719@gmail.com>
 <tencent_36C6A22A8A475F824CB6BAC101A1F272E709@qq.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <tencent_36C6A22A8A475F824CB6BAC101A1F272E709@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for taking the time to test and follow-up. These results match 
with the other machines I have tested the patch on.

With EPP=performance, the TDP toggle works (~10 W locked vs ~26 W 
unlocked). The fan toggle influences the temperature. thermald doing the 
one-shot _OSC unlock matches what I see on the other IETM B machines.

 > 3. Windows comparison

Based on the data, the unlocked power on Linux reaches the same range as 
Windows.

 > 4. Quirk status
 >
 > Noted on holding the quirk until the power side is clear.  I saw 
Ilpo's review
 > suggesting reusing quirk_cf_sr4 for models with the same boolean 
mapping; SV1
 > does have the same CEFM/EPLE mapping, so a simple DMI alias would 
describe the
 > driver's behaviour.  One point I would like your call on: our SV1 
table is
 > cool/quiet/performance, exactly like quirk_cf_sr4, but the RFC 
reserves COOL for
 > the SR4 ("aggressive fan + locked TDP").  If you would rather non-SR4 
models not
 > expose COOL, the SV1 mapping should be limited to 
balanced/quiet/performance.

For the mapping: I used cool on the SR4 because the active curve was the 
aggressive one. Your matrix shows the same shape, with quiet about 10 C 
hotter than cool at the same package power, so cool/quiet/performance 
fits the SV1 better than balanced. I left the QV9 on balanced because 
its active curve was quiet enough that the difference was not worth a 
separate profile.

 > Either way I am happy to wait for v4, apply the exact version there 
and test it
 > before sending a formal Tested-by.

Sounds good. I'm not the maintainer, but sending the CFSV1-2 DMI entry 
as its own patch on top of the posted series seems like the right way to 
do it.

 >
 > If there is anything else you would like measured on this unit, just 
let me
 > know - happy to run it.

Thanks!
