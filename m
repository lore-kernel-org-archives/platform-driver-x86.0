Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CBE54D
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Dec 2023 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="WzJblL9s"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6803466a1ccso31873556d6.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Dec 2023 14:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703976393; x=1704581193; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZIH0cllwWP10xEZ7qclYaGxBZpXoISgRGheC+EsW2c=;
        b=WzJblL9s5WcFHtPruCmD8VKuI5L4zDuOBb3kc/ERqm55ISpz8zQTa3u1SWB+5TcE8P
         hM/6Fwey6xz7cOzWUax2Z+Bggizf+mmoUH+Qv/zQyFJEQ8boZDfRUMAAkPSy4k5zG+Bz
         9QPnpgIVcq9X2B2hPyhRMYtMTSrYiIq2eUBfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703976393; x=1704581193;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZIH0cllwWP10xEZ7qclYaGxBZpXoISgRGheC+EsW2c=;
        b=oqmHUJL2E3R5qwAL7fb16lBZI0gc7I5ph6/MTe0nd5nan3P0M1eyyyR11OmeZw9JLz
         V/Up7P6OYB6RV7123056Icb8eKW81hqXZlsyrvC6eRiHsv87HkBaJLw3ksN9ZN1VeKoQ
         rCEbSKIjGMv+9l8/Dxf1svC+7h7fOpQquksbt0BmEg9RF5Pzy9Awrnt7R1wlzwKJzUlL
         DQTByP0UMGZqCV8WobAFLzS5DvSIvpOOaSPbxudbj+waYu8CcsODzJJFSy5N2uEYbas3
         lsUcM3q1LaWcRFbibS6/YvAjx2dt3DNlADqEksTYTItIaKXvf0ezuLJQoz+gKBEmz/d0
         drVQ==
X-Gm-Message-State: AOJu0YxbXutYjbt8UG347oZ52dm5V/mwWlbD09zqjpG1cZbnBs1WVl90
	HuQy5wRhd9PXPedWSHe+nohUPZFSHhIn4g==
X-Google-Smtp-Source: AGHT+IHJ9upV4SW2nHDVn+pdfd0Dmw6j+xR3o3cnnfx5doXDlyLXLFSm+v3OsxVzMPdKpASOiFCHCg==
X-Received: by 2002:a05:6214:1110:b0:680:1099:851f with SMTP id e16-20020a056214111000b006801099851fmr11210203qvs.83.1703976393569;
        Sat, 30 Dec 2023 14:46:33 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id da7-20020a05621408c700b0067f2c03d4adsm8136440qvb.100.2023.12.30.14.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 14:46:33 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Sat, 30 Dec 2023 17:46:30 -0500
Message-Id: <20231230224630.12618-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f564b1b4-d8d1-4809-9cc0-b01aa53570a0@gmail.com>
References: <f564b1b4-d8d1-4809-9cc0-b01aa53570a0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

> As far as I can see, linux/platform_device.h is not needed.

Correct, it's no longer necessary, I've removed it, thanks!

~Ivor
