Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B91D5CFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725390664; cv=none; b=MirapKbpQokoRLQbQH9fX96+m7dhDSF0m8EhqHlRPwt4dg/zWJwSizFQ0ZoHTbg1Z1QiKxpHreQmXaZYQgOR1ZdG55Hm8P59Q7mPJgPhj1nSSHkY/9wqte9ozKDGT/E2v6YRUmrXytQpX/HEYAtOj7vl8znayLgUD5TvUAcupcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725390664; c=relaxed/simple;
	bh=jflcQBPDjZt/OZzaJxpRWjTsTeS1u1xR04ACHlPLDOY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=SH9EGkq1Bc+w/7F1UpcJD7rfhNI4efgZnWPMACZMiaLbmIut77QLNqwhJiXRxt4rQfKfLyJHZXN4AZrXEhhVcOGKKrBFGHH5HjpQSdSu9N7oVP+ndxOSFERlk1ORvp9cgWfUCipJzLY1diVmXa1cvgUXE9yarnpXEwE5VqH/Zig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HppV9aYq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HppV9aYq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so6059741a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Sep 2024 12:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725390661; x=1725995461; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jflcQBPDjZt/OZzaJxpRWjTsTeS1u1xR04ACHlPLDOY=;
        b=HppV9aYq/yOZ+4anrGT2CWA8G0YVF9NxjB0A8T/+eL600bDb/68kUF8nM0mxUCIGG0
         LtILtsMCfzo4RdUMMNvtsFXnLcoZfcFdec4V3/ttCbZaCQJRlU+ir6IFgHkPw6oIj/AK
         VYyHH4cujHg5kga5OWLxnswLlHJgJ+ftAq+aBM397ehB8KoTs2PzgEH4ZJDRojD/MO2A
         3JWm2C9INIHtKgPm6VZmo+xHMGFsD6NecT9YZLlTTNm9Tg00i33xVvd3BzFMJ5/AO6nB
         iSbceZ90Y6eCSBEzi+5UxkB8e6WROwDwepMw9fVsKuiUbuPpNFFj4BGViKLkcsoFfq1i
         qKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725390661; x=1725995461;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jflcQBPDjZt/OZzaJxpRWjTsTeS1u1xR04ACHlPLDOY=;
        b=KjT6HuR7BWutgTqfgeQq8VyX4ShnBbPzCmqGlh7Xl+YmNtgrb0IgAcFX6Yyh4am0QO
         qNuruUsxlSzFEPVzSIgKgTsj+yeduKeyXZ1AzXI9EWDR2N6lvCTY1NLj+ASjfSEjjo3/
         MJDi5XxzXGmUJONbrQlA02acEr41lsQoY8cVG06vQ6xWv1cXEoxOG7J05MVajKnZ4DnU
         D+Bd7UDzlfd2ECLsB+1rWpnw5+/ecRd5bdl3Lr2eHiAkrrhJUOqROMPLqiXcvMw8ZiyW
         5IK3kT40euF29ZDmGlkklyepQ18oxgUO/uIUzYjnMAOQC3cU7/oW3O1GZVnIlgZiq5Qz
         cFrg==
X-Gm-Message-State: AOJu0YxT5bvMfflOW2A7uE9kMG1dX0x5k9EZ3FGsz5YLTBvjXfL7Lni9
	bv2cdvqYyj5i2+rRaaVgoCICwduV9qEupRd348GqTwbpgF6Lk/wieHpbNw==
X-Google-Smtp-Source: AGHT+IENUJBPheLHPyyl6tkTfsbzB3DeBLgBV6S3tg5w3O5E25gk0HLu1EX6aFiQ+zLIT7S0zhDjMQ==
X-Received: by 2002:a17:907:e8a:b0:a86:9602:f4b with SMTP id a640c23a62f3a-a89b972952cmr776479366b.63.1725390660474;
        Tue, 03 Sep 2024 12:11:00 -0700 (PDT)
Received: from smtpclient.apple ([89.19.67.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6cfsm716500066b.60.2024.09.03.12.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 12:10:59 -0700 (PDT)
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
Date: Tue, 3 Sep 2024 20:10:49 +0100
Message-Id: <62891F43-E938-4DF3-9E51-9CCE19784DA8@gmail.com>
References: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <3c63701c-f9fc-4f98-b991-58135da3fcc3@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (21G93)

Hi Armin Wolf,

Any update on the progress for the driver?

Thanks,
Rayan Margham
