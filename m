Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446623E320
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Nov 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763985229; cv=none; b=TbWBLJUTo75utiNAPAvyGbPg6efifYt9gU6Vxn+KUTGQWot3pn1V4HANbt6s4zWvkmJ7hhCIenvx7KRZM8qIQTilocJKJPowBrZmeRxLQHy6kJASEwK324X+Qf5IPBc7j2R1rPvRxo3DkJ4EXLQaT3ToqEEgnjp77CaR/TSuGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763985229; c=relaxed/simple;
	bh=4vTYZ4gjon/h6ZxCwulEvZpS66EMn77ujDHrjcEZim8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5aG+smroEZKJMh3JzPMDZa7tckSYNaqU23zRusc5WuPv4xijpMvThvzMkAuFL0schewDpD3ExTbtq8tCkt5UBdh/6DU3dXHqy22UFnjm/qbrVqCTThXb0fE5SbmN2p2WZWgMkOeB+uB3QhL3BzhHl4BNBR7XS9uVxJ38s+SHcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3rpUnNR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3rpUnNR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so37337265e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Nov 2025 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763985226; x=1764590026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=anBHc/erd3Gbv/JIz7fZUDhUOiccefk45X3qX7qyTCQ=;
        b=C3rpUnNR8cBR62NZN+vwHp5eJCqd05xOugAYj7SQB5V0ce8/ykbSi73IV9umkhAroj
         4IicJA+t65OMdIItooszmz4Qdf9lKIZwOcmE5fbLsdq395zQ5kIJDxeFcKY8WxBqSyY6
         hpNhgfbX1Q6VOU1jjjyb01pF+72L6Cx7CJDNMpMuCQURichXXo7tki4Rn2cvYwkCUbKV
         ZtiqPCKJjbiIaKFwSBDGib7FEYBIM3aE2+Yp5svMbSkYejpDc8eI9SCYptgZ0agwVulQ
         WA9VdgR7Swm9hlub5SQ/ROxHVmsm2Teyq/hUSmwzAxbXVi9s+1afmjdSotpyPr6Xlm38
         iySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985226; x=1764590026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anBHc/erd3Gbv/JIz7fZUDhUOiccefk45X3qX7qyTCQ=;
        b=lsKE//TXwgt7/QnNCKcok9wMBN46Ct0WJ0nLGpsua8EFbSY/aKqjrnobNlvn20qPLv
         vaRBa03SG5+CSmKi/QAKmZoqKEMmxdgJtPMkNl6MP5Bwlvafsnn1DyZKX96ZAg8kHL3F
         VeO34qKRFHTrVwiwyrdQRiugdmUXqZFHJESn7E5bFZDLHOP3eznmD0KTg3JlxyYAeb9G
         GkndZfARpq4nNK19WmdStbd41iefYW2PR+L9hr/anPZik5ZLEhPdSHMbaD6bN0H0vNVI
         3/OXkrYP9NnU2fTpcm9t4565jgPMcpxFI4sGjuimJOqxTAlWGAhTNP76RR4SjOsJuAHC
         +iHg==
X-Gm-Message-State: AOJu0YwYHxwO6wHWsKs3fwwuHd4IfMHNa9OF8ebdgKMFiqjl+a70pNND
	QwO+3BKdaSO0lITPA3W/jZavLHfbZRw/OXm1zQEivXNj0sg3Gkton3mJZI6Glpgctcg=
X-Gm-Gg: ASbGncsO35dqEmT48/UVcf89MjoY/GgyGg+AqM38Z0aZSv6/FLAWC0rMVRBdJZDoHGh
	dZYuILQGzzf3MleJXeauC1oItgkQsmCCNEqNvcHsAui4u9kmvdBxzTH7z5gGyshRBD/Rumx+sVz
	s8+3CAq4jMCJ8u2gt5LIe2zJ1reRuB93+DCwOH1xQ5IOF7lHn4k+ERtTYqhP4hs1xfhzhVPnayG
	d00q6Z9MFWTSJwfYa7i2lxbfJA6VhEh7qe7N9jsiEvguA2/asaFnEdEm1YB7/eZKMutnpyLDQSw
	L1P5AfP4amZIQ5OrQ2BeClZ+qJXUQIxq426GI+MRxCU9tU8C/GiS35MBvjBtIv/sb97EVqjNMOv
	4gScBsvPxsgKHaSknahKzhsNuGkouP0osxXU2trz2VT7r9f5nhCHBQgXECBVOENZz3uOrUq0qRy
	h2HhOVSk1Q7W9S7qjNIOH6UKfqf4c=
X-Google-Smtp-Source: AGHT+IEAtmV1qD/tg6i98pVtDDoYTcOvdc+KM5CudeS+QYtKkhJH0qlBgVtPi9KFUgO0PaOi7hr9uQ==
X-Received: by 2002:a05:600c:3115:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-477c01f5997mr106959575e9.32.1763985225782;
        Mon, 24 Nov 2025 03:53:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1e86b3sm226174065e9.6.2025.11.24.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:53:45 -0800 (PST)
Date: Mon, 24 Nov 2025 14:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Message-ID: <aSRHRCgoKxxmw4bt@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Luke D. Jones,

Commit f99eb098090e ("platform/x86: asus-armoury: move existing
tunings to asus-armoury module") from Nov 2, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/platform/x86/asus-armoury.c:147 armoury_has_devstate()
	error: uninitialized symbol 'retval'.

drivers/platform/x86/asus-armoury.c
    141 static bool armoury_has_devstate(u32 dev_id)
    142 {
    143         u32 retval;
    144         int status;
    145 
    146         status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
--> 147         pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, retval);
                                                                                   ^^^^^^
"retval" is uninitialized if asus_wmi_evaluate_method() returns negative.

    148 
    149         return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
    150 }

regards,
dan carpenter
