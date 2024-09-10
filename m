Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815414C99
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981335; cv=none; b=kmaIetcBs6h5l1P+J7zuoqs0tA11NxzBbRhPBR++M/6wpxntVaKMAK7cDW0uq1DrK25hi1PblpKlP7B+DkZfW2KajioCD//x3ks31xmBVaOh8pO7fBVjnMbcl9p3047b3sQpY/vFpLJ7OY+4ffn0sTIrKXaCMe/IdkFTUXa+iNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981335; c=relaxed/simple;
	bh=8IqVMauQjpVheaxz/rTeOOrfcTjwXCse1FuLjgHKABs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=UrcFaC60t9mHl7xnowP9CWy8h1iWv+I7UFevYkUSWjUWUBtWYovdHJqdnYiy/npOoIA20IU1+xDPisOG9Qoka8l2Qo7OqFmZU//IQqeL7Oujl0lrEIi7sCTVaX2J2XMiJwS3LrmIyCOFevk9eO8ZMmnWQONOxsFGlieViCXo6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCXHdVKh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCXHdVKh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d3cde1103so446306966b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725981331; x=1726586131; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dL2oGtrxckmnA24/CYQSCuvIyf79gKSURauY9UZsoi0=;
        b=gCXHdVKhdCdF/glqebVm2AvZwLQzMdWJN7xM+RCwhuU5jRdLXNZsSa+dKC4xyhtjg0
         0/OO0bIQpNzLnQ8xpbRPcVFNs4uOZsxz0lcy3gBwcfhzDhm0DYnIWIKGBlMi3bUG7j99
         WTSDo359E9jRxKjV5xGBddIeYPdiX3KKzJ+yzMelQ/0JWkzo5DD0dLgJq88Pc2yzKcSy
         b9p4wJCXm+I3er27wpaqL+NSny/6cPbjrIjk0Onn25bQnTMoGv/I79WXpYA5KGHl33x1
         +OUDEvgU07abaViVPwAHVFK/ah/y/dp7xeXBtdnNbSxnva793JxQimaJcQR6pxxqSsLN
         9PHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725981331; x=1726586131;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL2oGtrxckmnA24/CYQSCuvIyf79gKSURauY9UZsoi0=;
        b=K60okaAxQXA9Ww39SP2nLHJRADqamqKKVD36x+dyW1AL4ZuSrmG3mGKj7yeZMUBlmE
         WN6fRiqDyiUKMqkY3CsmUcQinVRqMtIVA1wKHFLMA/UNIDS69ggBm3akmq+hqc7PIVx+
         IrAFQrs+xXkVScgwDIKmZBPdk9juDTQf0bWvPtKMATBk79Xru7Cax45YgKiLcCLyDnu8
         N/02x7NTktw/UA2tIcWTe3KnM1tvG1cvvzwPOgs9jb0QoDyEsLpg6vdeIO3e36atlDyW
         Qk9Pk8LqaASyPpqcHd7ccoqXquFfSxtDmEvCbXRpeWt75mRGIXH/sqmQChUqwUYVXCRT
         7q/A==
X-Gm-Message-State: AOJu0Yy+PX7YvLJ5juUQQ4KRgi/bf1hmdoSLKJO6XjqYEwpQ1jTvl1JP
	jfE07Jg2caDnOR03LOySRaVNMIskZ2J/vR94PfFjRhE+8rjyC7RCjRDqFw==
X-Google-Smtp-Source: AGHT+IET0jfd06VqEn1tn2Nin6LPInuEHkUotQH54pbGA9fGGlZTt/FX9qJqRrfWvPFM7cslQh+9+A==
X-Received: by 2002:a17:907:9709:b0:a7a:b73f:7584 with SMTP id a640c23a62f3a-a8ffab88eebmr116884566b.34.1725981331219;
        Tue, 10 Sep 2024 08:15:31 -0700 (PDT)
Received: from smtpclient.apple ([109.78.67.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25952632sm498557866b.60.2024.09.10.08.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 08:15:30 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Rayan Margham <rayanmargham4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Support for the Acer Predator Triton PT14-51
Date: Tue, 10 Sep 2024 16:15:19 +0100
Message-Id: <CCED5974-1C40-4693-A7DC-887FD3E5AB9F@gmail.com>
References: <bbc42008-f121-4710-a27d-f32b9deabcac@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <bbc42008-f121-4710-a27d-f32b9deabcac@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (21G93)

Hey,

No im not sure, it just randomly happens

Thanks, 
Rayan
