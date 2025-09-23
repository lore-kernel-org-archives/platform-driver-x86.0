Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAEA4A35
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674850; cv=pass; b=OuzckwcTiVNZrigF+wLy/zD/DgSYqjPsjOXlWq82Pbn8t05t19BkceowpIowjXrM3ByN3xe+EznKGixnQVzxYqgu4KmIGbGyTYR/wxHrLdsRgP30U/mIwdRiaNqZf1AX1murQQubHDlP1kYUIMi/gz6++TmulPlVH5X4PY/+r/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674850; c=relaxed/simple;
	bh=bF9nK89L+M9GgAYWH7hcZZStnXYIjMZOAxoefHl6q6Y=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=XypOUosjHt7CXJYcXMcaiyWLXrN7DoLOADwNrcGOCZiK18hsQeHJXRKOjqgE/Crebp6QFeVtXEqcq5ziIoRFcjnkqMHfzjdaEcR+34g+RNuUPt+dcL7eXfVISVZYZjQzv+v7i0x9CKul9mw4H2WOUOUvuBMC4wY/TkGPMpwOXbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=YCtGbBg9; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="YCtGbBg9"
ARC-Seal: i=1; a=rsa-sha256; t=1758674848; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=WgCGgQWhEvo0X0UtWTXm4HBpK7EGY6R2DGj6AZCRLFqdFJs8FdlAIUslLwtkP6+tsQZ673L+A4YYnG2VKP//5cUgOZNMm+7dzIMHoR1/jSuO1qjDf+gZ7X43TzvQ9BWxhXUme9IYeSLfG/BeM8pu5Zwwsn5qrNqxD/X21IP5cSo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674848; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=bF9nK89L+M9GgAYWH7hcZZStnXYIjMZOAxoefHl6q6Y=; 
	b=dG387MerGjg7MklnzHFTBMnuigc/GggWiLPpAdMbQKaOgvgfby6w6VmumQuN/W84Uwf1VbetU0e+2caPOMu64TeRfpcSVjDqGampUNNUmafyUhUkPYBR/G9XatUuFUTVMvNL0A/7LMIiBNezksXSgL7yK+NpCyzc2rIvE2uqC0Y=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+4269a3b0-98d9-11f0-9ce0-52540088df93_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671934866459.3350198889349;
	Tue, 23 Sep 2025 16:58:54 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=YCtGbBg9D5HcLTkddmpX1Dc/yiK8LBDMOeHMobZbkGNCYnbgHxH/8oRt5qXZgNO4+B7JawYkIUPlPkGfVKK/7JxdDO78lCShFqA7ekwQQQbhQ/Q+WJWfPXFQrPkF9GBWAB6nUij5smzkZ7baUVqQZxyWw3JU/CI+aFArwsBtgxs=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=bF9nK89L+M9GgAYWH7hcZZStnXYIjMZOAxoefHl6q6Y=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:58:54 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: platform-driver-x86@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b
X-JID: 2d6f.1aedd99b146bc1ac.s1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.4269a3b0-98d9-11f0-9ce0-52540088df93.1997904116b@zeptomail.com>
X-ZohoMailClient: External

To: platform-driver-x86@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director
