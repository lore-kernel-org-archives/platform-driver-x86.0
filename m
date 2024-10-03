Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83812FB0A
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727987188; cv=none; b=e8xqvvLuaOiLBPGCwLJ05q4ZwsSvq+uXx5KpMKko3RMUhWEraZMnrG/4XwUGPFdkWPJyYUGZCvR+sGfhDbJmmReAV3S0JDnGNYQWVjYZiqVQNbBAnRzJ2Qg22+nAumOR9aWT7qpQPRn6NtP4x6jajUCLTJesQMjX/eLeRPxhac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727987188; c=relaxed/simple;
	bh=C1DomCNmKMXLK6AlSoNquFyRw6DNT4QcSJTgcZD77Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBHj7Kn36LiI9qNPjJzOBuIctFxw2Cua/s09Om1JnGeT0AaFLfSRkg3P/jMoD+vHhBzhbginwITXW5lJM20wRXpp8Clm9tz9LkQZ2V+Pd0q10au/KdBlitj0ayF1YN1cIbqt0kdNjzkIGl+XrnOVkTH8AcC04+oNIdkqL/+5D+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HhT7IpHn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HhT7IpHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727987185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HomQjpvcRTNve3Qu20rKbEEquqz5PRdVenr+JDr+mGA=;
	b=HhT7IpHnUNeYldr9TV8T07QIWe7/1wqWY2/gO0jE6G+NeQ/l0oBQHvFp8Mhy1yOTLwZcou
	sbHnqMcw4Mi3SJXEOWeo5WsSEH2zRb1JAnokHUUG9jd6gJx5Y3EJ+xn4OaoTTvMB+C2uzt
	n2sMI+Hjqa3JI1FLHH0Qi0j+0ibFXa8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-8vBJlUzZOASJeUz3EiG93w-1; Thu,
 03 Oct 2024 16:26:21 -0400
X-MC-Unique: 8vBJlUzZOASJeUz3EiG93w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34ABA19560A2;
	Thu,  3 Oct 2024 20:26:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.16])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20A6119560AD;
	Thu,  3 Oct 2024 20:26:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Todd Brandt <todd.e.brandt@intel.com>,
	Marek Maslanka <mmaslanka@google.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	regressions@lists.linux.dev,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] platform/x86:intel/pmc: Disable ACPI PM Timer disabling on Sky and Kabe Lake
Date: Thu,  3 Oct 2024 22:26:12 +0200
Message-ID: <20241003202614.17181-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi All,

There is now a second bug report about the suspend/resume issues on Kaby
Lake platforms introduced by commit e86c8186d03a ("platform/x86:intel/pmc:
Enable the ACPI PM Timer to be turned off when suspended"):

https://bugzilla.kernel.org/show_bug.cgi?id=219346

This second bug report indicates that this also happens for s2idle and
hibernate, for which my original fix does not help. Here is a new attempt
at fixing this.

Paul this replaces my previous fix:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20240919165349.235777-1-hdegoede@redhat.com/

Can you retest this on your Dell XPS 13 9360 and confirm that this new
fix also fixes things for you ?

Regards,

Hans


Hans de Goede (1):
  platform/x86:intel/pmc: Disable ACPI PM Timer disabling on Sky and
    Kabe Lake

 drivers/platform/x86/intel/pmc/spt.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.46.2

