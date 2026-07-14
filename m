Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6CC27FB1F
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 05:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006898; cv=none; b=WvVsiZF8Lbc3tQm9Bs1s2wmkoaDqv/myeqVvx7Y5WV8ij8Q6iaJ2ISTaQjaN0s9n5ZUvbNFWu/+DfRw1FihfpKDzTle2PUmewM1Ul0PCA3AGxksvk5L417bvKyzxlNq5GGI4hF6mfo6om1HpPDibeFTFokpQFcksLhFOogpkZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006898; c=relaxed/simple;
	bh=FIXHRCg/P9V02VBeDQGaYQGDDLGszNk6z+3ZSyx72BM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qWHZY0UfgOVVr1z8hAH8BwkzQ5k31v1BcHyeSCXIO7KY07nI7HtoSXGklLWy3soT3pC3dUqfqBDcH5kcF3sqAiSQ5F6njBlx79JYYHQXZCE+Fv9sxHnZ2LihurmhlcSOMI6uJgZHKUuByvxTLALj4j1dyK4HcADYTiFZUovuFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=iMvVueni; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="iMvVueni"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FIXHRCg/P9V02VBeDQGaYQGDDLGszNk6z+3ZSyx72BM=; b=iMvVuenihTS4JoKrDKUZfc9rCn
	5YnBohoFDP/UT97oQXd5Hzcv15StVHc6G8YNFtuMx3+Nwb+ratbMj4+nGNGXEhZHw4o0pMkdVDgID
	gtaPflePDZKkF/6qcZxp2NjZP7GclWAZgwzFa3sdshWQJw3clZJO/LPf6pYge5e3p7+2rDMo0Dspb
	jpokzzac+fcPR3hJGfIk5GvmHPb3iUCvhRY4B8zLlLw4/Zdao97v3SUhUhudWqE7PubzS7OLuG0ec
	ygGb/SGNt13gFTNGUb7jljuXRH3Yd0J0BDq0FiXbpQB7S8YV22Q9fBLtcFHbpSq1Ap85NEOTYv0tT
	9eaW1XaQ==;
Received: from [207.189.26.187] (port=64411)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVgm-0000000FzgL-2ibV
	for platform-driver-x86@vger.kernel.org;
	Tue, 14 Jul 2026 12:28:15 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: platform-driver-x86@vger.kernel.org
Subject: Dear platform-driver-x86, project info
Date: 14 Jul 2026 00:28:12 -0500
Message-ID: <20260714002811.8F50D1A78E4C3A6A@inbox.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day platform-driver-x86,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA


