Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955756;
	b=WpGSTk495UpKN28GVx9Piabh+hEFUR4KbnYlLqfY4XuMD+ENOmZdp5LHVU9iI/LTmeJN
	 9Q6ZSOGfFDE5wUk3q799LtWHNYQtmD+z0Q926Q6sdX5efpdExgs2Cqu/d6MY7MCPG6Hb5
	 nQ1A7yBrnSkpPYId6Ggu7XX5iVUPLRJrAEdaFcLjwrc8VSWnPkIICzeTzzQFNJHt3sPPx
	 XbdCPVggUyqh/w3yJYNnQy4y0dwo12WBw9V6ac1Qk7vFu4rHINBxu7zFRDiyJTdV/WPqW
	 Ma1A8Fz9jZsVUZFA1R9N0eW5doDvDVswz8NJbYX3zOL3XMqgmnzkP/J+GUXjIW44Rqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
	b=ptUQigOxy4f8Rt12+Cfl3PG8pJur/9WF+ZvpBwcqiK3v+QHDDrPQYnwBedSMnzMxTjAJ
	 L+kF7GxzU+RGokHjUoc2eY4YIGkUc89oDB5DD6ncg6NOADkSv9pqLdu7GueMcKO25i0Vm
	 VyacHxpG+9QKGkUfQ5++94cIaozof5fx3bW+Rffp1z7qcpfndbncg1ngDmOJjtT8LMvFL
	 109Ns20mRdBaT7NrSDQqYjs8drDJM0QxEJAdU88t8l0VqaF1/0LAOKraRnz98UcodIZBo
	 3l9YPiOsyJW9FTFlk+Iy4VP/u98kEdk1wcQP8leodH6UkpwKRaZr4DTAw7EkjJo5dzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UxTV6It3;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E717606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E717606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UxTV6It3
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53669f7b518so24772781cf.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955755; x=1793560555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
        b=UxTV6It3jXVjD3oVGMY5goBRy1ytdu/b3h7rYnkkk7CX3v4yuaU/pgSq+GwaiVB+q7
         DaMqCvfHWFGZBPSIVEvS+7xt+xnNgS+RUq3NdE5jcwJQ7+3ysUq6Zyaig3l8ConK7zBj
         PDafMnMUOaV9TwlxwvT+fp86q7SqsWTsluVRlKEF9zqhhmlqz/J+pqxxYCXzOoBgqhwR
         loa7JndHccNAhWHWUUmnhm6urCKwWzqs58qHH0539UuSCygzxTic29F4Sra9CFlbkwJI
         /P8njtvpsRxQvdMFTz/ArlEVV97zYXnR49io+rOgVNdXS9IO775XvDUjVhxPEhaiLv+Q
         UNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955755; x=1793560555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
        b=NvWHCo2pUta8DCiO9UG6c7ZTq/XRYF9qoe+Rxz4xIuQNcuSH6yRCWX3vSKXZ81SOxa
         RdBSFHXN6GBUkOXxYdU9o5t0wtp1X5Tq5sOdxg+r6rsTM6iUywi71vhg5r5w+B/lDxeq
         bz0NaBQA6RnlAhZY9g8f/zgaYVEabFaknxw+XXmopwT8eLS9d6B59xqg55iP44EGHFL6
         RaAi8zFdprCzZRTu6yAfW9QwOzLovpH9ypBkb3UhmaqEoklzZzuz5va9QBHhQyvwH8aD
         62P69OJzhTCwGev90mtNsK5vS9wRuxshHJgdKwf3RYRFTFfukSyML52kZ9C9AjMex0Ik
         7Rlw==
X-Gm-Message-State: AFq9FYJ0TXGb8XxUry7BqdeoR0YoEsFbQz52qFBNx8fOWgmFYEE2jCSX
	8rhPGY09ZWGVovnw/W3uT32m6coz8q+6h4BXb5UfLF8DP0CyjqAtdHCT
X-Gm-Gg: AYBFou3ScbSap5Q1wGsJ1t238m/VGtG3SFmvfxHqp+fhVHNL4AOyOym8z6TsKoonmbx
	jx8eSw13Mzwfsx1TemIbb80vRD/cP8BFAq/8IQ5IYEwu6H7ilyMAX66nym9OoWSuRA8kpb1KQS+
	lmUI2JcdrDYe2xec22W6/34GNHNPdTwFaIEiMnPCVfUds65gUk7N3e0yCdz5UNlGRgLTJjMaThn
	t4hY6UDMV92KIdzv+mGV7n1hW1ZC/uzKeJhU08lDGvFdE764cs+93wBl+wXcrImnrV2Znx2QA1t
	jkWwKkeH4IdZlPYmAViAsDGssxxHfoq9t0QgsQ+V3SP0fc+2H769ndhFzIw1F1zNo5hS9xNyR59
	V5iDAxELYaL915dUfxahet/egjAOhy6YYUcCNeMnpswzkLOMVoU6S4WM0ZyjrWnIlaBVQCAD04i
	VEObEzmVjEJzYEh74DZPMsHWMeHKIzneVyoszTbLbwTSbIfTBoc2xslRn/QtLP/z6WPUBhVMcvc
	ENUna0MPwFu5u2Q5//lU83OwxsY5tBzdqaXc1tvYPN2B2W1m545NaPuPyOylwhScxYxCkGG5mRF
	bxoWqdy11j3s7/yYCjz687KEIGaVUNs=
X-Received: by 2002:ac8:6f11:0:b0:535:855e:6d15 with SMTP id d75a77b69052e-5383b4ef5c1mr78362381cf.30.1792955755510;
        Sun, 25 Oct 2026 12:15:55 -0700 (PDT)
Received: from [192.168.60.8] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c53fdcsm52343606d6.27.2026.10.25.12.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:15:55 -0700 (PDT)
Message-ID: <18bdb633-f168-428c-b3b4-dd8f91cbb9fc@gmail.com>
Date: Mon, 26 Oct 2026 03:15:51 +0800
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
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20261007190446.38862-1-alexyeo362@gmail.com>
 <31bc2c6d-5d06-e278-a701-0bd4138598f9@linux.intel.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <31bc2c6d-5d06-e278-a701-0bd4138598f9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for taking the time to do a code review for this patch. I have 
incorporated the revisions for v4.

v4: 
https://lore.kernel.org/platform-driver-x86/20261025191300.1259541-1-alexyeo362@gmail.com/

> Multiple of these look exact duplicates. In such cases, we try to reuse
> the same struct even if we cannot then exactly match the name with the
> model.
> 

Understood. QV9, RZ6 and SV8 now all share one quirk_default with the 
SR4 keeping its own table. The DMI rows still say which model gets which 
struct.


