Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02B3A544D
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045045; cv=none; b=f8AlNygwWsxZHnOd/+RdRQ98T3suMEbFQgvOQ9Z+lfjZj62iiihon+/aezfYB3E9rUCN1Cbu0WEAqAaBSpV6JmsMHTE0fh8jXyqOXS7h+Hqe0GezOq+DlWIJfA7oLEQqaJfQYUb9nVs3Ws6ckdS55Nvo+5MTrqh/QKZKrGnjO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045045; c=relaxed/simple;
	bh=irgH7TFKWsCQd+BMrX30N75UFfoSW1iaBqVHxmkQ8sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7TMo8YN5/cF4Lh24zx1npsnCFPdafyyvSHLJpIEeoFD9s0s4qeEy5rS//vphkQboC/VU+osGtz97hVVjxKdgTkQYgn0C7pT+hAYXlXdz4pX0CkeZkNY/Lsfrs8ciYFI40qpQNKjiK7ESXGXxwnaAOTb55e9tGvEVfu3P9tgZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgRC//do; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgRC//do"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaed195901so29804445ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775045044; x=1775649844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZE0lWI868d7gL9thsanG/G7YM/a6IZbtCTZVwOfg+c=;
        b=SgRC//doVlTDDlmUVL0zezNIj8e5w+lKF4Im7gMO0c4Ach5MTAjvJDUQntiaXDFOv5
         8qdi4OQ/G0g28rWWXm1Vxv0laQ4XN4ll4RI2v3VXrIr6viHopfUEMjvoIWAKGRH+4sYr
         n+wVwsK5i7KU+JAEowEYZcK5zo8OadKoXbb+5TjGjgkz1L6I7AjoKDoTYJNd79T+VtvO
         EQGSuejX/raMH8SUEsLnB5aWVPvkWt2sHucPtOJa2dMugrvaHAPmhDUEELRg/TpVrj3r
         /09J5o4nhsbIOEWIp7UNMO09Ny84Rq+YbWKyVFZYUoRBUb7KrzpNu2YpGuAT48GdnAX1
         tlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775045044; x=1775649844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZE0lWI868d7gL9thsanG/G7YM/a6IZbtCTZVwOfg+c=;
        b=lenVUTYxIFHbyJVNmlWAjFtReJvnheyxlHeOOsc1ikmWkJL1ouvWzSm5RtZi0theA+
         kNFnsq3la7AWMYDKaUEP4BqN7bdjdVk7nJHTyDhN8E47fcROZSDqIj1/1TaqbzBDAmaj
         71gMDQmDVfSzILsuysOj4lI+RRcqCNBDQdlxeXVb9JJ+3USB0bdc1M4dtEoxi7ZA47Ap
         8fIOMi9i1263DHzTHjtsiYFHDj8WWiLKrO6ewBwVcGhqCZEbs1ybDG2CS+SuqrkNm6+T
         VZxGyFbh2zCGQe3XLpxW/96sM2OtCGmBIqiy78vEhsDJvA0vrdHrzeVK/SUUdvk0Ugk3
         fuIA==
X-Forwarded-Encrypted: i=1; AJvYcCUa9+hqxvUcU0x1waYkEKda0s+kC3Eqmhb0Iqr4pM/PHQKSo/+q/dKkVQbapstJwRvK4u0i//QWUVx5lSD5ebN4iwTP@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0oJttmrDVJt9rnbSPgwvHPbffE7c/zUWFpdjLWrdYiISykMN
	fGnyoO7OPRf+5gAzwve9IQkbNHNPVCbG8jMZvNupyy2sNoLPJ4fskpQCeG6ForuH
X-Gm-Gg: ATEYQzzHpqHL4HMGKAY3YbyKGFz0e7cpDfT7NYK4P/ssQoeJpeCbwfnYCUe3HvUsjfQ
	rY2l1VNBoXHYqGD9RgUfXsVmfa2T/cz6zh9WPWwVFzYM9K3BjRhrzU81ydbcxH/qUDERh0/OczJ
	Oy3eWUL/Edy4+dn87lIPFCunAeBQCmmHghRbuMe04r2WYxAk1LW7Q5XZrylxUwBL+Apkpu+LwR7
	ynPwZghFHm2RSEwUOPgeFaU3zPhx7Z4vL79Mp8B9BoJcczkGyFW6Y167Fmx6gfM5FNvmEF66ayT
	l6w72MMlR8sC9Xn4fEDRJdamT/GjQ6vSEBIqjHsAoaJuGqROQJiwVREniTyDY31NNzQHgOIBoED
	eRxRIprIhtcU3otg0/CQ1BDfQrtS8045r3AuHxmh/i1p+CbTkZvyxJUKBMg/feEW1YQ4dyLsFpM
	/mksJJhW5MlgoBZRUCtOWpG6juFx9004Yx3f8BmuYTmFT0wMgl/mzCaNFS1CWW/005e4vK4cJtc
	AS4XLAf+csEXjU1xt3n
X-Received: by 2002:a17:903:8d0:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b269c88bf4mr35049565ad.38.1775045044009;
        Wed, 01 Apr 2026 05:04:04 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277e8d3sm144736795ad.55.2026.04.01.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:04:03 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:33:59 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] platform/x86: hp-wmi: fix fan table parsing
Message-ID: <ac0FmFZYSWn6Cz98@archlinux>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
 <20260401111748.106970-2-krishna.chomal108@gmail.com>
 <f2b397ea-cc1a-e27a-b5e6-20c18bcb95b3@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2b397ea-cc1a-e27a-b5e6-20c18bcb95b3@linux.intel.com>

On Wed, Apr 01, 2026 at 02:23:31PM +0300, Ilpo Järvinen wrote:
>On Wed, 1 Apr 2026, Krishna Chomal wrote:
>
>> For Victus S devices, the BIOS fan table header was being incorrectly
>> parsed as:
>> struct {
>> 	u8 unknown;
>> 	u8 num_entries;
>> }
>>
>> The first field should be num_fans and the second should be unknown. It
>> is pure coincidence that interpreting an "unknown" field as "num_entries"
>
>So this coincidence is that both fields happened to contain the same
>value? Or (same or) smaller?
>

Yes, for my board (and for the several recent additions in Victus S list)
the second field in the fan table header happened to match the number of
entries in the table, making the previous implementation appear correct.

However on board 8D87 (and potentially others), the second field contains
a larger value which causes the following check to fail:

if (fan_table->header.num_entries == 0 ||
     sizeof(struct victus_s_fan_table_header) +
     sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries > sizeof(fan_data))

After reverse engineering the Windows implementation, I found that the
official software ignores this second field entirely. Instead it uses
the "stop-at-null" approach implemented in this patch.

>-- 
> i.
