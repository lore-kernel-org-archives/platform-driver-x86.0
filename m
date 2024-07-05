Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A2C147C76
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jul 2024 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720177212; cv=none; b=H779cFkITa8Qms1wiiE32WW6ZPHoGJADwjDAgQVB2MCB3ZHjySVlHWyw8ecTMp2x5N2OG9C/vXUKhYkJGWjQ3s2dOoCVDKbdm02GClrkcTWIP07bI3biZvfuTnGwEms3QfEDnEdVbIzkauBM8V8Y8heTcgL4jBYsADaUfCMEEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720177212; c=relaxed/simple;
	bh=Be32wocSmDK2mfCG4qebEeh0MDvWQqLi/XkQ0U/ojHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaykJ/DGt/fsAu0DOSEr+x5PNxNvRI9h4uDvx8P8BNmROJ6zhRRapvulq4ZYGMrttjyn1kORjnn6MtbIRha/e8BlIKqEYvZ0VaIoI8//6TDmffBglNma42qviIZ2FxLvZqHkHMK3zIOQ3Wso+YqEzYJLNNX8bX7HRFSr5Wha1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PI8e0ooR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PI8e0ooR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-425809eef0eso10068135e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jul 2024 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720177209; x=1720782009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Be32wocSmDK2mfCG4qebEeh0MDvWQqLi/XkQ0U/ojHI=;
        b=PI8e0ooRk7QpeBaB2/MUbXYJxInb5husKT8xh6DyQxAHFknhlaHxmSe3m0LOLq3T1a
         mupOMCTGUjbKoCZgidv5qmSqJic/xRD4cPEfzmsl8ffNKi9UH3i4TEoM+ttQADpCAo78
         orhJSOXzl3V5rMW/cZD5acQz99ex5yxVdsD5uT+VogTICo9rQGZES2sm88/mzdwkojyS
         tTntpCm4Nh48ID2gCU2flM7WWRLTAn8bhXXc/wrIV0twzeUE+8DF8o7aSnLUCoHSrfWm
         WPVHn5VoPDVB2Feh+jVGp3Lf5lFDbaTBOK+KHv3/8t43EfjiWHtPZf/9oekQwAOGLx37
         WvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720177209; x=1720782009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be32wocSmDK2mfCG4qebEeh0MDvWQqLi/XkQ0U/ojHI=;
        b=C7UVH7wCXRCxBCSXous/FVTYBOtAHfP3Tl/L7hU93vxmjfr+y+o5o6dkFm2zfj5RKm
         PEphOUjtK1lChOrnrcwM4vwkYsLPMFxr+HgaWWCYqWBtEIiKxUWDQmTATfqoHhkhmhFY
         oFuuMRWN6xQFXvPVqMsB6+ls3nTst6TU6v2+mnIRW+Gjb7QuBMBvY3AMs2kJJ4ozCNAS
         w9rSAJ8DQ7y2jOe8HPyehv+sCPi2yB2VQkyfJlzC23vyCTZYWkD6hx0lQTUMF6A1nALZ
         vOENbGwW1cz+kiMgPSMCHikqzXiaF0N9P5NiI85w3nz56h2Yfmo8I8kGPZnGGo6E7jvm
         FCEg==
X-Gm-Message-State: AOJu0Yz2TxdgbhoFXdy4g2NmcrxzpjXPTzt5Xl0GGFAVTeX2CTkERPx5
	t2aE0y2GwHEFiijwbGQ5yfIJD+vA6c5vWRA2i/bgsWUXZh0/89QIVUg1Tw==
X-Google-Smtp-Source: AGHT+IEXKAHgi47tl+f22RzYWktVytbdzQlPNyFO39yzX5Xqx9DUD2vpuCMWPbKz1nJ/7/Aq/8MZ1g==
X-Received: by 2002:a05:600c:25a:b0:425:8cc5:b3c1 with SMTP id 5b1f17b1804b1-4264a3e1abcmr29577745e9.11.1720177208605;
        Fri, 05 Jul 2024 04:00:08 -0700 (PDT)
Received: from alexis-pc ([163.5.23.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1dda61sm57182795e9.19.2024.07.05.04.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:00:08 -0700 (PDT)
Date: Fri, 5 Jul 2024 13:00:06 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv9] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
Message-ID: <ZofSNlEH6E6L00dy@alexis-pc>
References: <ZofRxNfk-ExL5VnN@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZofRxNfk-ExL5VnN@alexis-pc>

Thanks again for your involvement in the review of my patch. I appreciate your
time and effort, and have learned a lot from your comments! :]

Alexis
