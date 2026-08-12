Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0943933D
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533536; cv=none; b=PERIi1cXK+E/Y95PWR8yDxN5nPlHQ0TAm1j8cqxQKELi9p4NNkDGXL/MxUzaldniRhMO34C817ovVrGec9agaIdkX0QZwPj0fIr6NMMUTkxMwHT8cmyWaoOoNZ93Bp2NHzJr+6hJd/m3nF7CWTu4X/ynHQ0F4WSZBRCIVLT7s5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533536; c=relaxed/simple;
	bh=rhIU1zG+Cz1JEJ/DZCxK23rcEZYVi7vpJbqoVBA+2qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyW69o7BFS7m1p182FoYJiGl78+M9glWLSOcM5Iv0foiMm46poQVM0eYHR0CYgM+0LL8u1Ej/DtZiX9FtQHVHAWh6aqJvgz2YwbGjRpUZFKn6BcEMzB7FnIymIP56oZxuEcZ3L0HDUdCh8jC9718kPSEA4cJdOQTUey9chtpGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyDDhKJQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyDDhKJQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7854678cso551746f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533533; x=1787138333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzXAlvJrvz8VJKZL5THLFAhA3g1WFYpeVuZ+6qv41B0=;
        b=eyDDhKJQcUn/6qaVG70x5845SB6g7ihlqCZ1k9C8xA4s08vUsk807yQ2iMtWsio3AR
         eyWyrgb7t4KDldnvAQbkbVKu9qRmGkn8fyAb4KLpFZFPN3VV4L+kWVJRpgedCGc3rtS1
         RNwFF3phhL4r1S04kTxp3VeywprfsEVJ4QIOBUGJYt8zZtMsXQYIw+WMa1c8yXcXI/Hk
         CyWCvNOCnMkPfCeVphomyYmgSylyVP4OV011SyQKlB+nw038Tea1oPI6Zss8wvXxUnCb
         JCer5DqazN1QUHGUOAyJkS/691E3Q9hpy47cZAuQyykkXhxzJYgH5Z4Kdn23CPmAWgdI
         hKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533533; x=1787138333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzXAlvJrvz8VJKZL5THLFAhA3g1WFYpeVuZ+6qv41B0=;
        b=oLLRF4+hCHdapAzyBwDkW5q7La4gY9mrgjFxw5NJb23bbuFBamFwVKvxn2ZCSF+q9C
         VSP/4iqahxdJU8YgmnAZN2VIpmKXmikTyZylJBKPy/xG2/0QL+1B4zls5Lcv+zdsinL+
         vwjqrGHNmklAQ0gi5upRjbhmSridUlw88B8I92EZSlwhBCLj+ROplyyGNhrF4GkkzLY4
         02GyY886JwaROB7G6IlUmM2Go/N6/zN39C/ieBlUFnZ/WbS9CwdHqsu6xzsVDqtUNf5R
         jclKb8mhZIfHcmrDmv1o0MQLkdR3UC4CZXy8l+j2eeZbsc0GLk2M/N6eR/24f5GYrnwL
         kd5A==
X-Gm-Message-State: AOJu0YzGH61fzu43ffO4aIr7p7HghN1WbSA8l59hRn23GF5TXtY4NhFi
	IGoV+oDtrQTiQxZT4SKxdjCJcPoBqzw+8BW7keE89bGRQqCPWkxTPbBsYPLKzuNm
X-Gm-Gg: AR+sD11I6kHAi9ml6DuEWF1zX1ip5Q72aRBwlKvrB+KmED8Q/FBjuBQrP0sRlfd4A+M
	f+X9Iq/4/vl38PJYt5Ta87OrjHOq/NR7+5+5WacMLmOtcFc0gBCHSf16V3y+gOj5YhftF/UJIWs
	Ite3wA4boVcNa75NAdyw4ZdWF6EoSIhL5yUJhZyyc+zl7z+th7PmGhkzobnqTwlWve1q4ihuiuR
	DetnQAFCSEM7qPLww0PEvjcAyIVSG93zsWfwImP6xKtyExoJu87t+AoClBJif6qlLWDIch2Qx6Q
	KaeelyRLwaZdN/Q49eMW24Jlc4ycSzlRxZifAj3UntDkEjcO+S0LcZ7fQ3cUko/entHloR3tbhK
	wM4Q1ZjCh9r3pSSq7mSG0KQUoi6Ha4AlXZPgkXZ5nFBCldnlnOMj2GhbTecanpO3P0bvlX3rFFb
	5ER+12jWdMoN5m0XTh1v1dZKahUExKcE/3Zgxc6IGUWcbRZGYGBGOGEQ9SoP5K/+1NwtL32eE74
	NOJnM0G81+hcQobNKoDtyreHkH1g9Ss0wu54gDwFQ==
X-Received: by 2002:a05:6000:490d:b0:47f:ebe3:ca31 with SMTP id ffacd0b85a97d-48152dfd065mr6373537f8f.28.1786533533075;
        Wed, 12 Aug 2026 04:18:53 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:52 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 7/9] platform/x86: hp-bioscfg: fix new_password_store overwriting current_password
Date: Wed, 12 Aug 2026 16:18:27 +0500
Message-ID: <20260812111829.172273-8-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812111829.172273-1-meatuni001@gmail.com>
References: <20260812111829.172273-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current_password_store() and new_password_store() both call
store_password_instance() with is_current = true:

	static ssize_t new_password_store(...)
	{
		return store_password_instance(kobj, buf, count, true);
	}

so a write to new_password is routed to current_password instead, and
the new_password field is never written by either sysfs entry point.

Fix by passing false from new_password_store(), matching what the
is_current parameter is meant to select.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index acb123985ede..6bd56d3f5bd0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -123,7 +123,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 				  struct kobj_attribute *attr,
 				  const char *buf, size_t count)
 {
-	return store_password_instance(kobj, buf, count, true);
+	return store_password_instance(kobj, buf, count, false);
 }
 
 static struct kobj_attribute password_new_password = __ATTR_WO(new_password);
-- 
2.55.0

