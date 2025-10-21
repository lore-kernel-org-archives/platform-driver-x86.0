Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187A26FA6F
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Oct 2025 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761088580; cv=none; b=VzdRTpnRvtvNUzgtqlVS0iXL5Z+4OAMPHvC7s2N4SaLdHrAxeNS39TZYDHAie0UcBLtOkoqSFJgvRGSIM9QKsz1bQLZn8Zbh/ONym2Dn6/TA/CVTtvjLP7msoeLoA97YQwn2tlOLj3TNovufmoMzlIRCEO/HkimW4gFHKmx+y00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761088580; c=relaxed/simple;
	bh=MkrCXOKD8Uo8t+/oSxngnI6HGdowLk7sk5mgxdJXK2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=JIw/YLvPPm4i1bPuztYKHFtoxxPbFK3sJNDvDln2EMfFnj1bIWRXUGRYkvmUKBawQIBcDfF5T6jRxekYQxGrpojwGLHsVYXbtO0lWfTP4j4r0MJYn8F+JlgL0WRybBAfr8M1PtpP8eYySRBxvWhxVsiApdcXhJCWnyiRmuQP+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft4MRMs1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft4MRMs1"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-36a6a39752bso62018791fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Oct 2025 16:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761088577; x=1761693377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3iS90oGUh2sChEA1Qdr/sH9FOKItDj8EpmJAd2/xNI=;
        b=Ft4MRMs1CRt/VtZB7365S+5OjFQ3X19yt34APhWDzMNH0J+8X8dGyOJrZCXu15+h5y
         wcaCWKC8CrSSC2MSDmLpn1GBZSskH6QUCsjNeuLA76d3jxSXj/nRYrD08XKERpeh69tt
         2A+fheMaFzkS1BqQDBGpSXi2U8yRSzh0dioUm6N1mpPj6oMpC6U8ltBMMsFA1Jx2PUYU
         qoo1B7vEs/T/13Whpkgxi04mDs0C75Mu+qczMN5zZyeospktm5lCGxjyBeI67mKS2hQo
         3hKgGPv6pAX+bJht5qptzFz4DSqz3UnpP2WTsseirQEiSn/jVL7krnWWZ07XYtD5KmhS
         cfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761088577; x=1761693377;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3iS90oGUh2sChEA1Qdr/sH9FOKItDj8EpmJAd2/xNI=;
        b=erIBXOsUCNfp7giDXzC8zVpoyjbMwd9oa1EhactpJTFRIvqR3IBJcajbF9qsVypcwI
         qQL/NqNAeNeN94cVnBrXjs8ruCpbHSqgIlEXZOwV2shTkI5RNxTnDFbVBpJQUeYXmHY6
         5kIgjD+rEy/LLRqCfmBW6CramqT4JyMeSipDwvj7IfUDOYPBCIlMaGPCwvoPwThdyQcz
         JKdQYOkJj4zzcLwqJeiFkqqZ/T5u+xnzTuqGcrfm4sF37BB5fBQI0M+rGz3AYMnkEFAB
         wuuxZ0p8cMQzZvlzW8XUAV3cnXZ/hER4MtTPJWxB9pvyiHo2tS4HA0rhC5Pi7BUcY9OW
         DVcA==
X-Forwarded-Encrypted: i=1; AJvYcCVzY53zpct40FzJGZyWzsgIyk6ZH4dUZOFVAvXWdwLFwWwKIN7JFyIGq18IJgPvxmXhvdEyqP700jSDhQUxRStSi/n9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9HCpONhX5iC4boODZO5l94ALb3+DCN9FVF881G9djegePMcy
	5g4okopWxPreY92f690+wMWk0jyqkmdk4hPge0rn2vBNEQZ71kC6+uX3
X-Gm-Gg: ASbGncuYc64ONDyy/3gHovTvYU1wH/kXXiNvY0LJ4axaRF0+8wWkR7suSWlzI+53ccn
	fS/HSmhRwLFNkAo3rYCAMFTWCQEMQD21eDdjYARYkbcFNgMSfO03EMGK9x8IC8y7YR6F/H0WE/h
	kL50Bn2eiR8o4aoKl/pCpxgKJBvDAPjQ85koan35oiHhZBDmrC6F85b90nepTdPRCdwAbH2fFLm
	TNmSLT8JvTceaSLEcWRio5X2Ouefht4NAM2UsxtHfBFZMX7EINcOwd2FI4NfplfYIPkGu4cjhiH
	pWOOnLbBElP5EBU9CSj5b4eUQ8zMW/KNEbZon7PSBMYxNMWX8xRR20F79z4Q5TYJUmjV+Dc3OEb
	TJ8/VR2uqiplH1T2S4HszhfW4RYX3fEhUWQN0d1aD1eZddBYDuM9QaJmC6+ZUS4mNggqgbzPmWo
	Rj3cMC+H9sW/Hv6PqrPKevBW9bYDo=
X-Google-Smtp-Source: AGHT+IFXQQCdVjndGUlAQt55SyUCqt01O1JPB+Zj0At2Wm92ggmQB/7qIpSekj8luvKqPDpYm3P0Fw==
X-Received: by 2002:a2e:a813:0:b0:372:8f0d:b0bc with SMTP id 38308e7fff4ca-37797833eabmr54004851fa.9.1761088576811;
        Tue, 21 Oct 2025 16:16:16 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9664a97sm32800741fa.50.2025.10.21.16.16.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 21 Oct 2025 16:16:16 -0700 (PDT)
Date: Wed, 22 Oct 2025 01:16:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: yazen.ghannam@amd.com
Cc: Shyam-sundar.S-k@amd.com, bhelgaas@google.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux@roeck-us.net, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org,
 suma.hegde@amd.com, tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v3 06/12] x86/amd_nb: Use topology info to get AMD node
 count
Message-ID: <20251022011610.60d0ba6e.michal.pecio@gmail.com>
In-Reply-To: <20250107222847.3300430-7-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Currently, the total AMD node count is determined by searching and
> counting CPU/node devices using PCI IDs.
> 
> However, AMD node information is already available through topology
> CPUID/MSRs. The recent topology rework has made this info easier to
> access.
> 
> Replace the node counting code with a simple product of topology info.
> 
> Every node/northbridge is expected to have a 'misc' device. Clear
> everything out if a 'misc' device isn't found on a node.

Hi,

I have a weird/buggy AM3 machine (Asus M4A88TD-M EVO, Phenom 965) where
the kernel believes there are two packages and this assumption fails.

[    0.072051] CPU topo: Max. logical packages:   2
[    0.072052] CPU topo: Max. logical dies:       2
[    0.072052] CPU topo: Max. dies per package:   1
[    0.072057] CPU topo: Max. threads per core:   1
[    0.072058] CPU topo: Num. cores per package:     4
[    0.072059] CPU topo: Num. threads per package:   4

It's currently on v6.12 series and working OK, but I remember trying
v6.15 at one point and finding that EDAC and GART IOMMU were broken
because the NB driver failed to initialize. This fixed it:

--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -496,8 +496,8 @@ void __init topology_init_possible_cpus(void)
        total_cpus = allowed;
        set_nr_cpu_ids(allowed);
 
-       cnta = domain_weight(TOPO_PKG_DOMAIN);
-       cntb = domain_weight(TOPO_DIE_DOMAIN);
+       cnta = 1;
+       cntb = 1;
        __max_logical_packages = cnta;
        __max_dies_per_package = 1U << (get_count_order(cntb) - get_count_order(cnta));

It was a few weeks ago and the machine is currently back on v6.12,
but I'm almost sure I tracked it down to this exact code:

> +	amd_northbridges.num = amd_num_nodes();
> [...]
> +		/*
> +		 * Each Northbridge must have a 'misc' device.
> +		 * If not, then uninitialize everything.
> +		 */
> +		if (!node_to_amd_nb(i)->misc) {
> +			amd_northbridges.num = 0;
> +			kfree(nb);
> +			return -ENODEV;
> +		}

Thanks,
Michal
