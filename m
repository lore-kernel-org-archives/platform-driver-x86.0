Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925374718D9
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393332; cv=none; b=uWWNHjuflH+Hsj0+pmGNjNWRzrppupqLrsopxFnIUfWyD0NjSsewHngFXfYdBDaaz9J5wPsXEY50t+M1fkcOsRoHxAd1UdPtF5td4yiQrpdsdJuKrddsDf1nmSrSvJI7ieRd+WloeiT6MC3lH8QZmUC0ENyZcsAc7t3pNgoqbjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393332; c=relaxed/simple;
	bh=my4YDzbRH1SMHunkPuUmuAiU5uL68zArqNJ5vfSr8BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7c/JoYsiu81r5F+pg1ko9A3mdgMwKF92gwVs4EZaUqGnLOFRdVH1u9r9oQqS7tGKlNNlxsGwtu5egdfXXT+Jj5zyuEbmh1dogjvZ1Oh8a4aaVxoiaxqxyFxAXQI3bhQWF8XUeB6hQ2vd4bLWzBZXcf83Fgg6hHynPOeDyqhVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrEsiyEd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrEsiyEd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso407020a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393330; x=1789998130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKtjDpEdHnXrE3SFNH1yDn+O+e2yDCOb7eFYMiTQ8vY=;
        b=QrEsiyEdi226z2SVqQIFQfNixV+WoUC32LdIs2xFhDv5gGRbZOFFF1CMYr7n9t4WQE
         jIgowQ8rgwgEl4gGc3sSeiIhO2W3MmYYxkPRvrbsMwd42l1yd5ao4IEStGA/o69uwBTn
         ZtHu+y79EO8WtqgpTefPlnD8MKS29EfCibCNGTlMk4qY3kYwmYy+VLVfngIOknnx4uo6
         pN5ZUACzkPLuVwrBDopB4eOpZYBqiHV37ogTkazeiAMVQxPdFf/HP4CpiDv4tmeuo4R8
         QtofJGp7s66BfU3AA1P1RcdI+hUl/7gsL9y/ovU/8hylcPmOAOuiMVKB1pLqvGqphtna
         JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393330; x=1789998130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKtjDpEdHnXrE3SFNH1yDn+O+e2yDCOb7eFYMiTQ8vY=;
        b=Dj+R58xxiOf0U5TiOx3QcrR7FaPMB/REeVM3xHQU0uCWD8YkM34oYhP9LPUm8Pmo8C
         5+eA+xNTRpTsX6zbn6qSTIaxMIUepusggAw3JIHKwDX5o6dcsnL4TI5cFu8+0qJbq3w4
         aS6cUmHjkYvdw1L+BSh9Wd7oJxMxdpgXej2k+lD2ML/JtpEFKy+6/eoLQNYTCS3HrPtC
         qCKy7CPJyqql5bL1Lhf4Vf30guooQj3YgS55ApYUK32rPB94MmwXDfa+sfu0Oyqzn1P/
         CiM6R+BjC+sNqr+zXGXjRzwPK2G+N4r2PcnlYAsl0+h4rNv8bvQDb6WyopY4P2MZ4X9k
         BxGA==
X-Forwarded-Encrypted: i=1; AKwUvBzcsCRlIj4hRiwc7aS3cSbQm2WKyeoKAGsQH/jEsLXqNpyJ9xT6ko125jQvcDEUhR/Lx/UK4nOQQ7E9QH6h+m5ANPRh@vger.kernel.org
X-Gm-Message-State: AFuF++l6lKjIOZU4olOhoMhzzFJAFUTvg8hPEe6PclNjc0A/WOFygF+B
	Rlqxb034ronWarGwSXiJV2t7hnvdo5ztcMUdLRHE/udz8SgsCC15HDc3
X-Gm-Gg: AYBFou1iilhwnXsSugSycMFRPlPd9XLFSgEQGF2wS4a+SOuZDoBUPsdCQKWDclAlviu
	vX1gSERXZ0hD63Qlyzsf5atIsjaoPDA1jdHXWTfOo4ypvoWRlYOTmdy7bpCP+pXJF9h3Qy3CeOd
	fe7i9nNx46OaLkYGzeRubH9XL11r9AqZDKzI3Y+F+KensOYhJNxC0o1dAdAxo6tYL5Be/rVOU9r
	udfSMmWlb5qghfXWMyLD3Jhbh7XSY+YAVkmSxGgmnIsbHwwsrNd7s8unjlRyoTRrRu+leR+GOGc
	7qlgQfbFKic2c5LMk+NL01ypox2jmb/cHvq13Fz7ktzGpaDvEMZpC5ph4ef29ZhOO3F3F/O85Co
	eHcYIKFfNSaGxn+iNLmYG0TkqAGtq/4it2fgjivnKp1CjVaHDGbmIegR0Fvi8WajiY3+JuXTQoH
	VZbl5+5I9A9+dUDmRKKS8diG754CDDl1Zt20LQqPF5ScOxYSrpaSkVKQLimGQcf6feLSnq5MTRZ
	nlP8TdP+xbPP93pvf+Lyu8WnaggYaa5OJ5abexb+pjnFDH2zR3UwCkxQ8ILJspubf4p52+5Wnke
	0whylqZrlchmu+le9bmW
X-Received: by 2002:a17:90a:d88b:b0:398:bac0:238d with SMTP id 98e67ed59e1d1-39dec21ea0cmr3673687a91.5.1789393329459;
        Mon, 14 Sep 2026 06:42:09 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm22104575a91.3.2026.09.14.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:09 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: hansg@kernel.org,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 19:12:02 +0530
Message-ID: <20260914134202.1295307-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org>
References: <20260913224753.30281-1-navonjohnlukose@gmail.com> <2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14-Sep-26 2:40 PM, Hans de Goede wrote:
> So I guess that you maybe also have Fn + Q or something which already
> directly switches profile ?  If you do then KEY_PROG4 seems fine.

Fn+Q does, by a different path than the Mode key:

  Mode key (F9)  WMI fn-key 0x46, platform_profile unchanged
  Fn+Q           VPC special button, platform_profile_cycle() from
                 ideapad_acpi_notify(), no WMI event

(Used LLMs to hunt the Fn+Q path down.)

So cycling on 0x46 would duplicate Fn+Q. Keeping KEY_PROG4, and added
a comment in v2 saying why.
