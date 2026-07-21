Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82223E49E5
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650563; cv=none; b=HBKng75TZbBUEsIvHKo6Hqxo2YUACq9qVPzLetCiG0kN986eyWMdSgONY1Pk+KmGdQQWSYRjiEY6lKXohf0flQGjBh7CJ9muptVovGS729SBG/6gllnp2KcgiynSFYYOfn6tuxSHlG7qZa/yP7VaQ6cz/cFegw9NCqPvR7EqGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650563; c=relaxed/simple;
	bh=0a8Jfrhj79DpOOf45KS6ypb9nmZ4p0kwiTYVIEOwp9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dL2TPkB5DtAj62tEa1H/2CCiTlotbD7PjUvb+VCKcofhZu9nYy8YfFWwbr1zTJFL0BX0UZ+LmBWoGpIEPWXJ3bLLVdfQrsWom7u3o9AgGK0f+/76W+vhv6bQvwEdFiY+tLXYaCQL+8G5EZQRRzvtWIx4pXiA5RZIST3Qb1sGFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnJLWyFJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnJLWyFJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4925a778491so6816835e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650559; x=1785255359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NIUWYbJohmYF0ilxotgfXsgI2XyduD4k/l5pe9IFZ8=;
        b=HnJLWyFJRgOK+vTiD+NU2hHTqWRICW1+dthltMKITdUSyq0IfRP6SKk7TiT9mL7Jh+
         Q+R+4wxx+fwipjbtL3TM9sLAEjUxZQi1EbLvuOqFbDU9wkl1x0aUGb8ZAJtk03tucVGb
         6UwCjLh1wpRXZlLTIbsIqTkl5LcTaLVPUmVRJV1t0oNLSF5at7jxm1HWA+NP2d6EESRd
         gh3n1Bp3DxTiqbsx22x8T4pAqMLSB7oQMRS8QWyWx1cOa7cXIQB1lX3y3q01Gf8d6+O/
         Mdf3OB2K60X64k2HtFMZfL+T7hGRDCR5VaKzV1rsja9RAB5HECNMrVmoGVsX/RerjjAf
         IKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650559; x=1785255359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NIUWYbJohmYF0ilxotgfXsgI2XyduD4k/l5pe9IFZ8=;
        b=TCLaemLl3cccA4qkESe3/yDpbg7kjsHqG1tJbI/7c4zwKQUeRifa8z95iPqG8whNvh
         Nukvx3P0j+bTdwB9yZpZd92zgsLKwf9eeY4EEw5cg1SqsBtceDD02r0lysrSh/LZV/CO
         LYbA3CvAx4yqF94FH9f8AWQsWYfmZ1t0UGe0mYGTXawlSAU39jXmcbggFnZ6oyUXCLOy
         uQTIScq1nb8ufGiMkz1EIqsbpNa1ZdBecNGsmEmywUInypJCR4wRE7MZnKn29PLYsDhC
         /OIS0Gk7SG5gyQ8TJhahBaC+Gkb7w9wMAL6amBQhOEiGZ5kGgboRt1+7Myeu/o9kS7Cu
         8cjg==
X-Gm-Message-State: AOJu0Yzy1OkYMBlS8whiencrC7yq/kSzHemqy0hIY2z8LKDWWZ1aRyNJ
	sJyVB5SjsWlKlYMR6u9qM+gaBYXijbOvYAiOmWH37iMLh+4xGayV5yTcIv9eVr0P
X-Gm-Gg: AfdE7clhrKSfftbLO9/92cYS3yulPr3PL8E5ft2plgC2fTRaKcwcgkF5rozyqeMKpvJ
	IvjzZ2XXozDOmNcAVEYHQzuOwWjt8NxFiJCzQjhYDlhh/VvJbtggjofpkqGluIDWzQKklUY5hjk
	kAbikzp5PW4K33wuHJHN3BGmiLrtE+aZTklQKqR93MYLifR5k7HONoBSw0oZHlqRSvlrkf1+xfZ
	TtvbjGe6ISl62LxVwIcXxSTw1crzPcX3SuamF+81GwTb3L7iDlWI3Z8p+Cot4BS2NN9RIEMACup
	/EnMBHvkxsmDEwxMK/2DFWDaY/Y4Wr0p1B67ZQTwCznXtrJn1oeVRqBdyk5p+jJPEmJojnIJihR
	h8YidvyhZQqiEITgNvWozNNN37/DfcwO9EBAxzT79xqWhYXii6L8uJcGQ2Ksqwrv/Yec1WXGofN
	55n85dbzuFKUVH+w==
X-Received: by 2002:a05:600c:1d1f:b0:492:7082:92e9 with SMTP id 5b1f17b1804b1-49565824201mr34108705e9.0.1784650559322;
        Tue, 21 Jul 2026 09:15:59 -0700 (PDT)
Received: from [10.170.9.202] ([179.43.189.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e51986sm45531246f8f.11.2026.07.21.09.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:15:58 -0700 (PDT)
Message-ID: <a9e5ded8-6e45-4b97-9981-98300faf80ae@gmail.com>
Date: Tue, 21 Jul 2026 19:15:56 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: hp-wmi: Fix WMI error handling
To: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, krishna.chomal108@gmail.com,
 radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev,
 mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com,
 jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
References: <cover.1784195117.git.emreleno@gmail.com>
Content-Language: en-US
From: Emre Cecanpunar <emreleno@gmail.com>
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the review.

These issues were found through code inspection, and I do not currently 
have hardware reports reproducing the firmware error paths.

I will drop this series for now and wait for the hp-wmi migration to the 
newer WMI API, since that work may address some of these issues more 
appropriately.

Regards,
Emre
