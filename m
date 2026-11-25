Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634096;
	b=FK7UtquhhVs2zbWu5k/JPiCgTv12JrPeIqbVt1sQIPmJAL8NP7VvVWRs5XzEUk0k3+5J
	 9p0fyBNEeqnpMHNujWN6/cSEheJ9v2nHkJ7xvYcyzeNIuFQe5EJ3447rN10mc2tzQ84YA
	 BNFAaHeDe2M4LdeCaKtBdoCvHFDAxo4M45S580CX4MGEFaFCgwGqlKqpRrtbzWEmKDbUO
	 wrIYYVyWz4AspMXLU66nOyp7sz1wnvWSAJRgkW+xR7g7BcZM5me3YgF7EHumCzoxxT7U7
	 swwBeRqvG74TXyUquP3Qf4tuB/Bcrc+OdlRlpwd8xyjFaUQJFGpKdvX4SzQmPHbyy+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
	b=j1jeFOOsCvM6coZzXzhGzWPAgbL1bImfHKHro8skgcPNY2SUgQcr2iIirXPZ9ZiQ8KJC
	 PCxeJn6iiHDKIPm4M9PCn82W8RcjAIF/dEyHHp3girbH79qUs60oAyXo8Om50IXJSgPnu
	 9Y6XMU+CIMzBeRSD7qhEXWyp5ZrpiQrpHUDqMhu+dc+gWwqkZoYNFN6OregvJQVbx2j4J
	 J3h9hObQJG8F0IMMcL4TiRv0xPwUZ0s+UDdJUwVugYphbyFD+WKk6QdH/8YD7rgvzYcwI
	 GJhlQqz+zp699uVikxs+se1NO+gByaaZdJvOPUGCoLwgLvv25eHTHgusJl3ksJo7/Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2dPPlwZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A5D606A681
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 19:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A5D606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2dPPlwZ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5118deebcfso927703566b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795634094; cv=none;
        d=google.com; s=arc-20260327;
        b=jP0zZczHultKHHeMuI2lsuxjt4+nccWIgOnTjS5NSDFX2SvNuckTD3cFl2SE9Z+cAQ
         xjGrQ685wwpEnl7WDnaGg6bXCKmCpnx4zIB28IuxvulR13WczkFlH9/Dpl/NQlvA2O4Z
         VbKwASEx3qg/JotTp6ElXRNYWvHBDt7GOs6XyPDkpJmqGyL6XH7hyz3C/Cj2nAf5qEyq
         vlSISw1uPQjROj7q2EA8YtpC43LqS2oXijmDKL3rUYrpcNwZ+GScmMHGlONR+eOuh4W1
         l903g47LVrf2myvXmjVHAj6hmy4rRM18qTJkaOzKh5Z6XMO0H8etpM3FTOwQAQ6XeiWd
         ffng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        fh=Xc8gMlWPXq1ZD5D/sSgi4BsJdgtSOcXmQrWq0VjR98c=;
        b=DBVZ2e1crj9rCoqO6KhPpMpXb7TavJTTMQlnjiGqngsZLRATIeK1fBStXDHXjPSDsK
         eYfFeNsvg/J3HMUtTDPoTrsae7JG/3TJabxbrj6d4F22U4J5Znmakn5sRt/8b6ezFIhA
         OXOhRHQJvqaaFnnUL+IBjU3YoLRFABtlAb0EMi+tHapQlijfUT5CJjxcUdzesX7rBw0F
         5tX2yXCX2+xN0LlZN9RNukc1yCRrgKOnVsgGfQAV1eAGEprxm2cIT4H+aFWy8zs+blao
         5AnaV38XMT+UUqFSZZEhB9uBxgZ85tSJlvVf+Q1nrSDwk0N+2CFB/ZZRiqzzZmZe0qq/
         tutg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795634094; x=1796238894; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        b=V2dPPlwZIw8RSSYGBiPS9riHjLKCbIKmhGH746G9Vw+WKNGoF1pK34jlxV6OxHliUD
         +4x8KQFOyHBv93Eslcb6ZQriJzQCg8lh+cuxhnJBCYxOkDEVeu6mFhuZ8Irk8YxD7JUI
         P0nrT+QohI1JLu+JiKfjBL99fAacsNfpvOFSzRO2EuUFWuP/NxYQnBYkkbBxIr2fZEKs
         KChRl/Mn72Pp2hAbFTBPHSRIemdxOYB5HdFyXI6WcRruvX4i2bkXwNbHo9fn6WKdOno0
         LUxobXi06oVo37gsBPfVfk8QKYDCnnLoBAUUHoKmqMFM/0Ywp/PVJ9W/q50ehnOTkPa/
         1Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634094; x=1796238894;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        b=A42N/W5wQr+yvbxNEgD7Qvt289OHJwLw46668fhRo+9u+H/3FAMvKj8O2rP427tf0B
         Zz9QlSI5lQqjPy5KQYbBKWLxLTWLKfbh2u1lV2Mhlsm2yaM35lr40MNqORLLzW4hJVc4
         9jPSZbuTuTbrvzfjbDQsmzFEFe+36C4nANkGUzF0TPrQL6hEu6Bdio5hlCmbP4EYebcL
         e9yJQK+3wKwhZyrr7pm0B95snkrWur/jTKzBZdx0FC8FHYJxBYlwPfXsI8HnFgEWU9+q
         VtdpnAJT0++8K8CmHzLdWHypC2keCTqBQwSRCpOe80En2HSMwi82Qv1NiL5/cW7oax9S
         Nsog==
X-Forwarded-Encrypted: i=1; AL+hErE8qvLCLRkN+sToBsBe7SZ11l/8grdgUKSyO3D4CsFi/QU0sUN0pl1aIEPWB0vnbhdYozWpbNF0WaqYHXRLwceQL6sY@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Bx/duoplAnp5J1Sr5FCbHTnqYIzZ3XQMzSBpV1PBEd3EB7iJ
	X7j9y6ZTM6Jk9GTFP4JR0fvNfwP+PK0YEn93TNngJzyP10+tZWxvjxTb17B8jJKItvgRT/ERX2l
	AUeMjCh1thfeaQnuwfriiStEavADdJak=
X-Gm-Gg: AZFdTZfX7Il+t/s4APRwsr0K8FkjcT6sAwB6lFmLBw8KoOgH9Un2rMXcfVBZMl/skr/
	qZ/CRZPG+cl4HzzYtRiX8wyaVKxmdBPNjzTJ2H3jHQdZzx3GPAV1kwcgl2XUyUVLTehm6sPQqNi
	OpkmfRbg6elMFcGxAUQofFgjBrqCWQz/yhpec/9F++JpOIXjwmVZOGLG82GHMS7OUVwV+GZO4xM
	HCTnqq0E3IpUD5xuuYuKrMXLJBlhdeFMDn0MJzO4z+t69z9X7TF4IkuoidLhHo31bnRP6/fglaw
	zVmY8n65wfk+iOEK9aKDxbluGtgG4lYPyBtUCIu+p0O+IKza1YSAtlVlPJ8eEMcES7hGIgHPbKs
	J2SDuZA4RPjw2t3z3C/7w06TBblFonh4IN320ag==
X-Received: by 2002:a17:907:9693:b0:c4c:ddd1:d006 with SMTP id
 a640c23a62f3a-c513ab47f40mr1465563266b.38.1795634093898; Wed, 25 Nov 2026
 11:14:53 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 11:14:53 -0800
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eduard Aliman <edialiman20@gmail.com>
Date: Wed, 25 Nov 2026 11:14:53 -0800
X-Gm-Features: Aa3M54qj30q9oeFFdGB4n11RJStBUerkgEvp5gMN6LeWlAY5SA1VjQECSLu4Xro
Message-ID: <CAA4HgYJpBHnAVav3SS0b+WZhAG0ryrJ2icNcV+uSbMof5_O6TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Kallmeyer <kallmeyeras@gmail.com>, Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahir Faisal <mahirfaisalantiq33@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

I tested this v3 series (patches 1-8/8) on top of Linux 7.3.4 (Fedora 45)
on my Lenovo Yoga 7 14ARP8 (82YM) without setting ymc_ec_trigger=1
manually (relying on the DMI quirk added in patch 8/8).

Folding into tablet mode now automatically turns off the keyboard
backlight, and unfolding restores it as expected.

Tested-by: Eduard Aliman <edialiman20@gmail.com>

Thanks again for adding the quirk for the 14ARP8!

Best regards,
Eduard Aliman
