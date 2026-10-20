Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540314;
	b=tx3zr+DYuAGgrP5uoKOy7LwPjLt1BnftdVG2yaEGcQ6iEFLWov4RbFQ8QUkvknL8XfCr
	 Q7qnf4I2Tx3eWbIyjsZXbOYEPUz8YyvpvNSbknsZspQr6XWGmRbW8aSBu7N4Pk1sSU+il
	 Mc2vyJf3fegobH2EllP0hK8lMyXKUv/kGy95PDwTYD0xy8A28wGK+v4YP2+r1gOOCCPVM
	 by42TvwznPC4kq0skyeKIyL5ApIED2CEB54BXX0mMsIKS5kreh25A4nGdRWzE9/avo1DQ
	 68WTjl1nIjXJUhQJu3We7C8zeRZ26oH1V8QDOimN7qN/PilamNUWBHFEHQhr8I6O/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
	b=xngfDnK5msYkvT0XV7ahOf0pISboH+slXWQIa4nVWd0VAWB5arvnBS4RWsm5kefg8qLw
	 Hk9n1gXCySmpyRTfAviLFsxjxF5dH9iWS0a5dKNwQS8TBx6Ocy1G88NnkrcYpMc8JfIBV
	 19gvEGQubXEBdm3WgS6XDoY3abP2wZNi57zVGmk39Y4NB01R5GTbJF4rl4mkctAj6i1HN
	 jet1D7ZhDo3+Ff7CDEM6loUngHqoulTu1no4SPbZubqIIW/AkVe93aT3jXOfzAkCtz9Ub
	 1qMGw6vNN9cK2IW0YLNS/bpzmhhbARpcrulua0rOz+nIPsCPYASZSVTnRJ+7GnAaSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CTdOmQui;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C6606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CTdOmQui
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eab93a9862so33420e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540313; x=1793145113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
        b=CTdOmQuiGopiCVVZU2MXAfnJLOAkcaeanDVdc5DVwX+6/fPmDXpwG3gn6X42u5XmQS
         LG+wy6vJrje5P3QXZ6elP1JnFcPbLHjQE94pZ374Aoc1Sm/14LNxX1ogGMncvkZEUrS2
         OPUtppOP+gu1o1vd3xZ7tpPyWMJ9T37Cmh4T52i2X2YR4HXhcfZ3gXxk/excWpw3/O2E
         mLVMInPKNtEIedCSWEKGwzxO/w6n3iO0iQhmlENYr+Y5t/kmppM5UadXx6DQAlQmdT4h
         /xXBZmNMXju8fV3kxnNtrSYPyubSmxHguCbEalE1Cxq958Vnq7fZ+sm1Xyoz8/4mE2e6
         iYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540313; x=1793145113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQ6YtacrcEZTPzjvVqKOtkJRuXcO/fhIADs6l2y4Fac=;
        b=Ln8WEr6LBSm3IgSZL/5q7uKx/kFsY0CsD1cqUkUgda9xsNrGeJcJ0YSWTaICPlq3bX
         eVTOtPSw94j2TIkOXkha8ksckZnGBXg6AwB5m6z3EG/u1/Ob9puHnJ08xOGno2s2+FVw
         /xY5VrxOcoTzUDJjkd5LBQJStCvsSOFt4SnU/bL6G0ZGmQXRKLQgzFD2DNA1G+lTIcPn
         OAZljFs12I85dfn+vwz8ILg6I6XIONFT5b4NQCLEoiASaPW4MRImle8p55iZNSl/pCLQ
         9hZihzEgufw1aysi4mQqGa8uPE6sDzJRulkOJtaPP72Oe6AwgJRBCYxHbKHN5dfrTLAq
         X9UA==
X-Gm-Message-State: AFq9FYIij1lDPVsx/5Y6t43UeKLHIum22Vkhu0/jeKrly5B89zP34fMY
	XI5wwiK/yTBtYDgG1gh2jgMmcwQyXbdVebsmQMXHId6koigt5qmHntMFQaY339hd
X-Gm-Gg: AYBFou2oNUb0VP9cBY8zq7fRks/Wg+3kAjximwSaa7S7uj4MOPXIeQNspQj2atgzyaK
	cj42cv8iswzF5GtBg25MZhFpJM/7Y2YSxriVlRlYlIsvEaZgA69inZ1KEyEhKOb9+jDalBySsZv
	oNXxNom06djmfzXOkQPqAlXHugwGTmxsEKFQp0khbIFvyyvjUO+odVNrgl2o9lTpYJmf0Zae2ti
	8p7uYbfUnaAgkEISqLqJS3IOlcd/RJuQIu4pkEtc8PqgUX7ZRPqmE3xNVHik927BxFL5AohxFjs
	w37whmQj1l5E5/D99ZJQ6qVeQbYFcqpIGlOE8ke19ENYKflIRE/4ABPJ8iOmrv7bI+smFiD9xjW
	nPKMl1JSnRYuwZZRkcSdVW5hOlF5uk+Cqmpi9I7j6Ni/oZPNxYHjDKqu/9yW2hABPnngIpe+gwI
	q+ZFSg/1Bznu6uatinzE8QDlkRfJ8qfROvzor2KuKsusjHHAARJQmfsatRoFD77Z+aQdxEVn6MX
	0eGGYUnhPhQi5JsFgttqBAWhaPSl09eE8mAwPVNXq/zausg
X-Received: by 2002:a05:6122:861c:b0:5e9:76c4:cf19 with SMTP id 71dfb90a1353d-5eaebdb1a48mr128021e0c.8.1792540312939;
        Tue, 20 Oct 2026 16:51:52 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:51:52 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 1/2] platform/x86: bitland-mifs-wmi: Fix response payload copy size
Date: Tue, 20 Oct 2026 20:49:26 -0300
Message-ID: <20261020234927.121570-2-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
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

sizeof(*output->data) copies only one byte, leaving the rest
uninitialized. Use sizeof(output->data) to copy the full 28-byte
response payload.

Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 44b16b7b4034..522b38e9755e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -265,7 +265,7 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	if (output) {
 		output->return_code = return_code;
 		output->function = function;
-		memcpy(output->data, payload_data, sizeof(*output->data));
+		memcpy(output->data, payload_data, sizeof(output->data));
 	}
 
 	return 0;
-- 
2.56.0

