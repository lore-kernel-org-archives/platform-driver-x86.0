Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344614;
	b=m6DhidsmkihRle/x6lQpcHslfZt6QPWf7bOqTfy2BbrkeOnfQwVGim95EJL7BYqpd0m3
	 xBqGpKT6b2nEuGk36ifJtHWwPixfqslSX8fkVXFZmyX9r+IbziXl4DsEVaYTPXhqQV1CL
	 fwv6YwTnVtyVMb++3F8B6ohGStxi3LQDj27F9F8baVmnQ0ZbWXOVDqFUccFSJTFtFsRp5
	 UdtPv/q4xd3gIgFvBt6deMQe4m+CNmP/S+6EKr4Xsbj3lDzUYJdkm1hKv28xSGFb99Yf+
	 fUDncRAoZ1jbAZPSwoJ2SgPptAzHpY0cXpIc32Bu9LVPCbDVmBSHrYem+k14INii2Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+cyDUgefXX5vanXW6aGfCpfkP2TeaOf5/UG+gu1qlWQ=;
	b=rlhe7VVjf6+4RiR2KgFPGrC3mHxbQXePTXcZI/ohx69mRISLPxW10Hj1g8au4VvZO3b1
	 MLZzyMPkmT1MhuFxEDzOKomhA2rZNjhRn/4x2H34w2OLTLVVJYoHdYZg80LHFwE+3K9Kt
	 9h/s7Zb5QccNwOTvc4PAekbjnWp7/dIQc/mItAI350mMUOaDQ5tOn7Muc0szUr30UHzzt
	 96e39/0eoTe593SMXnicS7fR+LT81jL3fHVbVAhPSQaiUc2hYAFHebFks57RAIlkjOigC
	 EP79NdKemwz5tWXFxwgNAdd2baFde+fIRdztCfH28iNFLW6YGmq8Bnpm/1oMrFcjwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeXwiHAt;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C783606A320
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 21:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C783606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeXwiHAt
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dc4797082so354966eec.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 13:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794344613; x=1794949413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cyDUgefXX5vanXW6aGfCpfkP2TeaOf5/UG+gu1qlWQ=;
        b=JeXwiHAtonQme0HQnmYXm15L/DCZJHgGwQlyBB2NSJwHZefx28LTVoe0gYVmeEz6cR
         2n/415J8hBkPCDHTeMycXGUo8lNcVO9fAALxfLpn5EIFIEoXK5IdfJNrgK53XumQOzNH
         qfFJWwHzZ7RnvqSDbHGXQKkr6lbvD9LaTvR8BrnJ0H+/Jr0Whdq6MZ/ZqXuEthv/Uqct
         Ehi2f/k9XVo4aMbYp39EokiSpAawuw86jbtQXNvGGExgVfWvWR9LXwApvHfHn/8ciFWI
         L34Vr6Lx5C164UdKfkFphGkZknddGP2VhqRFbwcQsEn0eDBS5kIaky1dc+VKDYYu7nB5
         JYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344613; x=1794949413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cyDUgefXX5vanXW6aGfCpfkP2TeaOf5/UG+gu1qlWQ=;
        b=tIojLKl9/mfVr4FFU+P1P93YMrz0wHMExn7Cat8QD+L1U7vUWj+9s6yyBAU1gDw1s/
         ujuFl+piNvCOPda0Uyw+ZTk9+UkvSHUOIT9fkZVmVE240IXhOE6G8B8oKu7tNClo79+7
         cXTjCUHDuP+BLc3b9oWdN3IzdidawgcC1ykOx3yudmWycC5VLhFXuZtn2sotjeHdUstH
         KsVhZQqsCM+dKWoQbCFyTOkZu7QYRIw8wIzR/+ZcJDcAguhavq82jaEHyt8GmWNEmef/
         kzX7C3jWh2Czv9aqJC3UXaVN9idEDrc/Y/C27EXonRRYo9rSjc8qNcKuvtv8z7wBvGr6
         5zRw==
X-Forwarded-Encrypted: i=1; AL+hErFTJ+lmF/FEyH6yOm5ygA6I7hYxWD9oXEsLgLVSwDOUkp0aTdNh2EpTIbZ70DjCRn2iba6oj7h+zCO7D1fwkhzUNCAE@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q13npc2KirsLD48TpX0ZfDfPR1ui1r0YG4RmfnyqzcqUgba/k
	H3xc3qhbY0LBrBfwux4AgodSQC/xsAcSsl5qBPKjG1maM8bbxldcdHY2BsEBkEQdM9M=
X-Gm-Gg: AYBFou2SIAZVDZvSqlJFNAbFr60dN0JWtVVV3w+GV3D0vH7xzty4VKHVtKKkgxwXaQw
	yJYqrrh/qLjoE1icOm9uqU0MozB4dHdqxO+ua/h1B5lCuwJpoT/5rppHqScMkyLWyV/jvU3wcKL
	B8s7gSmnxMzJTuITcnaC2f4zSDXwqNbjBN0iyq43ZgBURHCauTW0EDnDVDPpQIY1R346gkrh+7m
	8W5kWSCMd+GW3a1tYAOeEwQqOTP/RwHx+k/yUVn3W/8DJBswxeer1JSXhITQs2Bsx56wT4y+hmv
	q8CYrOq//sjza9k5sAKVJ+DNhEByAuAO6SOYMMS+6oXFUYjo+iLt+7b6rELdmoNbZdED3sfrfAU
	JJNZXL0j63VDT9trdweK8cr8G98Ah1ItcIXoIE8R+78vQEcBHl1FR8F63UWQ40T4VGVDXoptC0w
	VKenG51pxQ3Xs0Fknuh/Q2abIimNXstc69km9b+z0SZzaHTmn7e2F0s81+DPxACoMqDbIjfw4SC
	pL/Pnz3BU2tknlvI5IFjiFKB1C1YlZUnIr11zIU9iChfMeXKUc4jydn1IpWLvv7Cq9ASD4iFSGb
	DFSQ135TWE5Q84usBpuiJOxkdNFlXu6SkYfW7nZD/3sRMkEmD/OLZ/6OIOC5HLIRrsK6LyhD0sx
	dBfkExFZl0r/aCCL4uIJaAUMaV5Ei7MH8SiuJZ+FfSw==
X-Received: by 2002:a05:693c:41cb:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-37680a60bbdmr993673eec.0.1794344612415;
        Tue, 10 Nov 2026 13:03:32 -0800 (PST)
Received: from saransh-arch.iiti.ac.in ([103.159.214.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm14471039eec.22.2026.11.10.13.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:03:31 -0800 (PST)
From: saransh2304@gmail.com
To: ilpo.jarvinen@linux.intel.com
Cc: admin@aquinas.su,
	platform-driver-x86@vger.kernel.org,
	Saransh Halwai <saransh2304@gmail.com>
Subject: Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support for HP keyboard backlight
Date: Wed, 11 Nov 2026 02:33:16 +0530
Message-ID: <20261110210316.62037-1-saransh2304@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <e5f89934-2e0b-bf05-d571-b02622300595@linux.intel.com>
References: 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Saransh Halwai <saransh2304@gmail.com>

Hi Ilpo,

I noticed that this patch was withdrawn from review-ilpo-next due to a
reported configuration issue.

Could you point me to the original report or the failing configuration?
I'd be interested in investigating it.

I've tested v11 on an HP Omen 16-wf0xxx running Linux 7.4.0-rc2.
All four RGB zones were detected, and changing the WASD zone's color
worked correctly.

Thanks,
Saransh Halwai
