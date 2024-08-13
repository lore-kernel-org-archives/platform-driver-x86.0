Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE1A38
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 00:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723508995; cv=none; b=IJDh0tTsURtwb5vAuhEXuhMy1TWtcN0JopkhR0gQz/0RV442ziKKhUUzMBECPJBerv1cGy0tdr2j8TFkZxIITpINC89wGKBu/8WCa40f0lh2OP/X52EBXEzEPhYNfo0ndG0q3ROSYctqgcj5GkUDt4YihGuRAeqy3dIFHbV2EZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723508995; c=relaxed/simple;
	bh=xb7DW5pHlB9R0j1tEXJI0+S02oEtCnTBYDNLGbQl+Vg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=F5Ebsa9ul2wcccwdKcjmIJXx5aWLvlStGT7g3i01LWlwMPnV4fCSZ3z9eRGuvpSfs8exjgNV7yY/Ml5pMMSH8yTBhOCTPEzJUePmATrkCUZVHwNe6DQNg87SmB41IwR++ewFazYFtam1sy0H/GigUbWZtNvjr5QKU0nWdgK8hVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HobbRlIY; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HobbRlIY"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4f6ac1628dfso1632042e0c.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 17:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723508993; x=1724113793; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xb7DW5pHlB9R0j1tEXJI0+S02oEtCnTBYDNLGbQl+Vg=;
        b=HobbRlIYf4yTjQMrbqkllKYNKrtM53FqBRnmz0MbMRGtBYjeMOGEc+LpJ+G5ZoBoV+
         vGSis2a2G310RwbK2v7xrfgpxxXQ5oa2hYq7VwUayE81ga2G+eI+dHqm9sOVwNv2QFbn
         DZubTCoTP+4J5pR/OYeAPbQ8Sw0eVcqjxYcAO6dei/FQIi1gBVh3dPZGAmdL32/tltIy
         fEw4ahYMC/6siLgYmLGlRCUk6TuwhJVTN0njlLZACm4sxEO+2hq4rlqN626FjXu08g+w
         /3Z+rSfQA679jtCoxoGrdWi0eanK5U5UGn1LAxSuemnEvyqwVA24HVJc4v/SmJdTrgr+
         Jl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723508993; x=1724113793;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xb7DW5pHlB9R0j1tEXJI0+S02oEtCnTBYDNLGbQl+Vg=;
        b=VhEGpEyozGNmGCOrw1+vUXVCmDtD5aqKKsalMGsY4ig0Yse91pLn9id4j4ZjF5usVv
         s0h4uxgaYbbL47g4SxdZFR2hAXa5ge3RoojKXx82FzvF3hcGpVLBdqxg2cmJ/BO+90mJ
         cPw51yKEZuoRYqFicsNwjVTDAuAwF9A9vVN2HWejadLD5axTRaFDpqaBvgBLugBnIcee
         JTYvPZTMuoUYtvdqwya7bUsjc3+tLXaP3NQY6aGN2wel/XMG5n9EMSkHX2pUBgd8pivU
         gZHOy5pBoAOI+p8RP3j7lhX+7fVm6uR+pSQunfVMdfadyke3SkI/CIowMqESUwkB3Ei1
         MnAA==
X-Gm-Message-State: AOJu0YwahJihFjGYHiG3yED5vd0GgKJ8kJxDfUZBmpD6gSmuBLr6jITn
	x3qPOJGrvgoCIK+9aw9sSj8k6JqFh4F1cEYGAOyXTdrbUerjEa337ytbJHncvNbvAEJNJEl3aSo
	V5ReN88FNYHRiSc1iVWu2QosImLYsZcY1
X-Google-Smtp-Source: AGHT+IFLAIvbVVX/9YKLoN7WHVV8Wa10M4Q9VMDZWJPyqFt3+r3/4jIRaigiSXzchSGypsmGmz/Jb3x5OOmLO7EumK4=
X-Received: by 2002:a05:6122:2523:b0:4f6:e87d:5160 with SMTP id
 71dfb90a1353d-4fabf0881d3mr2551881e0c.9.1723508992959; Mon, 12 Aug 2024
 17:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Tue, 13 Aug 2024 01:29:43 +0100
Message-ID: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
Subject: Add Support for the Acer Predator Triton PT14-51
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently the PT14-51 does not have support in the latest linux
kernel, therefore its fan control behavior cannot be controlled.
Causing stuttering when gaming and such.

I am happy to help with finding the WMI GUIDs if required and testing
code on the PT14-51 as it is my main daily driver.

Thank you
Rayan Margham
