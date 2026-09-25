Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38CA3B19D8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354996; cv=none; b=ZmcBdoQ3bCd8E0naSNz1lq2cAPk91uIAyyYBqLpN/q4qSVRV+Q/EJNH1R07/poKsw4kM0xzHgsPWbkmtCrUNLgHr5hhJPU3Jl5e8YOpGiUgPBSdIlINuQHmCRE9elxsvXrcQGUoC8m6ALfCy64FO60r4Ta4wQ9s5VCpV7px4Tms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354996; c=relaxed/simple;
	bh=QI4pd1mrVmyzJoRtff2rPGRMh16mfUBtr9NjjUNTJBo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=U8Xq5RnWLtfiDAz1O4fl930B+oVXDFCg8feTo0lHu9xgzC8kMZqjm/enCJgj14A79SmblnQJvR2b/9mdpDLhFkC/8v78YM5m460bGcGJHlEPRMFTEYFYetvWn8vEgIircZaX/LZV/9jmpxPjZSIxdxtmddZdM178qiVWof/Wz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuOmo+E1; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuOmo+E1"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac8d1eso9774347b3.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354982; x=1790959782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iDmcmRnSxZd1NTrtE0bk8irefF61EgMeWUa6uFMmulQ=;
        b=OuOmo+E1Ki5E7SeppP2kfDyXEMMtSFV7vctT1DucQSccMREh28u3UYlLYBy5nhCesJ
         cyzuPp2ZbCabhD5A6lB9+fH9UsZc/+uBBSWDyG5i3JLh6qEk7d1qYnQ5n7EQxC05utFk
         XiroJtA6nCQREwwhClIghfU3i5/Rc74agnHhY0ai6VuxlMe+HfX8yGvag8ZTZX5ybLqO
         bI8TZt/nLpUT3EUXcr/EL0nKXp6y59LJNtDLkbzV9UurUoWYr6iCWUIkaTNhExH1Uf/n
         UO45ISbXwn5GBDg78jH+nycoiUSn1t7ri9efMuDNwHrtttafBzJ2ceK0z3uzSMrNkRKW
         n39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354982; x=1790959782;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDmcmRnSxZd1NTrtE0bk8irefF61EgMeWUa6uFMmulQ=;
        b=2uXXSZaO4aTE4wZypfc/o+mIaNjN2VvYNyOfrX9sMaWL21aNBxL5kF2SXhe4OShE2n
         besshnnlr3Hm0Xky6pJ+Ey9XTqik3DBu9Jaq23+3vuEfsg5Gtg/V9rYp7YF4lgiIfUvT
         gYEkrfjxV8aGqL4PM8xZoWt4FsRx4NWEcbP6iRb183xyqUVqxFJzYzCfDwFuNoReHOaV
         tfk6f+3TlhcKzUOKjKFBVtFRZgQL0IOiUtAIcPcjDKhZ2G8UdjiMTVu1+ZBTDEN6ml1D
         Pgc2zLYs/OACLalM8lC3uQtd6PMdbRGbXsNODTUBCgJSQAt5XkuG/imAq6F8kE80ma1Y
         kioQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIq86WR6MIEacYGj2m6PDI6CuOd1SFYE/aUcV9li/xlvqma/3/iIgWaWnPorw22RdpNdon+LosOwMuZKf7cQwyXFqC@vger.kernel.org
X-Gm-Message-State: AFuF++lsqk5AFWPSwbsE2OEWycHl48vZ35GGF48tS6cvYwDByH8IRIex
	zwKMzjUIxUe93Utw3jBmsznZKdjLeQU08DgK2QI9M4ACXsext7wo2H36
X-Gm-Gg: AYBFou0R5owMSnZTKTIjH5tba8hbNkCyVJWPrmdondRUfM5EJHWLuGzQESSeAihB2vZ
	j9Ll6WgwV2x1uoa5kmL15gBaxb5/8785jdZxYznBK64y4GUnDMailsIAoQPKRVAQw7cXIh8qJj+
	3aeRw1xBEqhlyrjST+rXMf1gNJJoeCCIsctqPpceLFVe+kCJGIb6L1dlfOi9jmBhlcTtbpDdyyW
	W0zN5bac4abRfYoPdrijsOcvy1lGSSM9jz6L6nIMaRQiH1VDyt+Ngzhk6vlGv3y1ee1WLgTeftP
	arT7v15WHKYMbZzzEjnSKQQ4Cf0pEnx3tze0wi9YMBzrfBdlQR1rmiclWynavPcMCx7Mb8t5CpU
	88BznCEcUXnatICc9dbRKd+C81Fs4TtDbDasKfy3OJZCU7gP40kbVWDrV6GC6xW1G1UIdQ8ZKz1
	nnFV8bEk15A3jF3QREVpsyi0R1cM3Jl26WTeDwS5k/0DY8OBxvyTP4weeJn3g3GC5IbIOisIS+S
	x3hpRpZNMpNvkLgWM+jwhw6DGQ1GUXYSqOfZ7HL475sm4OF/PosA8JT3EeLCip7X8mw
X-Received: by 2002:a05:690c:6d81:b0:873:5c0f:27d with SMTP id 00721157ae682-8a64b6215f1mr36505917b3.39.1790354981529;
        Fri, 25 Sep 2026 09:49:41 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm10587577b3.21.2026.09.25.09.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:49:41 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:49:39 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, mpearson-lenovo@squebb.ca
CC: prasanth.ksr@dell.com, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] think LMI v2 driver
User-Agent: Thunderbird for Android
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca> <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Message-ID: <1C5FDB3D-9993-4540-BDFF-1AB6BFAED91F@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 25, 2026 9:00:28 AM PDT, Mark Pearson <mpearson-lenovo@squebb=
=2Eca> wrote:
>Hi all - need help to determine if I'm taking a sensible approach with
>this patch series=2E
>
>Lenovo are introducing a new 'common' approach to WMI for the Thinkpad,
>ThinkStation and ThinkCenter platforms=2E The aim of it is to improve the
>user experience across all devices, and also to allow some future
>enhancements=2E I've been working on the Linux driver implementation so
>the new version works under Linux=2E
>
>I've called the new version think-lmi v2=2E=20
>
>Originally I started by including the changes in the think-lmi driver=2E
>There are enough differences in implementation between the versions that
>it got messy and ugly fast=2E Surprisingly little commonality could be
>maintained=2E
>
>So I switched to creating a think-lmi-v2 driver=2E The original driver
>becomes think-lmi-v1 and think-lmi would load either v1 or v2 depending
>on what was available/preferred=2E
>
>Related to this, there is some functionality in the dell-wmi driver that
>I think can be common so I moved that into wmi core=2E
>
>Would really appreciate any feedback on:
> - Is this a reasonable approach or is there a better way to solve this?
> - Any concerns with the changes to the Dell driver=2E Afraid I can't tes=
t
>   those and I want to be really careful not to mess them up=2E
>
>Many thanks
>Mark
>
>Mark Pearson (5):
>  platform/x86: think-lmi: rename think-lmi to think-lmi-v1
>  platform/x86: think-lmi: think-lmi driver to load v1 or v2
>  platform/x86: wmi: Use common WMI string functions
>  platform/x86: think-lmi: change name and display_name to pointers
>  platform/x86: think-lmi: Initial ThinkLMI v2 driver
>
> drivers/platform/wmi/core=2Ec                   |   49 +
> =2E=2E=2E/dell/dell-wmi-sysman/biosattr-interface=2Ec |   16 +-
> =2E=2E=2E/dell/dell-wmi-sysman/dell-wmi-sysman=2Eh    |    2 -
> =2E=2E=2E/dell-wmi-sysman/passwordattr-interface=2Ec  |   24 +-
> =2E=2E=2E/x86/dell/dell-wmi-sysman/sysman=2Ec         |   40 -
> drivers/platform/x86/lenovo/Makefile          |    2 +
> drivers/platform/x86/lenovo/think-lmi-v1=2Ec    | 1857 +++++++++++++++++
> drivers/platform/x86/lenovo/think-lmi-v2=2Ec    | 1292 ++++++++++++
> drivers/platform/x86/lenovo/think-lmi=2Ec       | 1847 +---------------
> drivers/platform/x86/lenovo/think-lmi=2Eh       |   69 +-
> include/linux/wmi=2Eh                           |    3 +
> 12 files changed, 3354 insertions(+), 1856 deletions(-)
> create mode 100644 drivers/platform/x86/lenovo/think-lmi-v1=2Ec
> create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2=2Ec
>

Mark,=20

Seems there was a minor mistake with the patch numbering=2E I went looking=
 for 6/7 and 7/7 before I noticed the cover letter is /5=2E=20

- Derek
