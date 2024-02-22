Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3CA6E617
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Feb 2024 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635484; cv=none; b=Tpiu30OZ4lAw54SRJss1ylSsS5rbwvPxPnqh0fP6S3Q+BVaDG0A/N/b/xHTG8iSQem7ah2vRBPz4JYuEl9+wQcQ7kBLG8VpjTqc58yOByem1VYtp6QvnvKT4BlxeFg0/LlQJsb7Y4L5zC7D0dUqbqMwqNI/nZfiz7Qe43XlKlng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635484; c=relaxed/simple;
	bh=KO17FxZqGQUTkWpzYZMY3Yy4KQM5Bz9Xy9i+eEsb9uU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSlvcfLryRi6Qu5M6t+pPryaMxfLDt8WFWZ3Zg6DmZOW5wfxsBjpoRjhIYKYx953dyg+ViZ0xjaU5l7QUDb5BjENw+rLjvxNki7ulOcocfFZkTRz2iedbVcY2VFWfdjYo9HREjNLNrUZvFHW/eKo78GKzdWa45gAbJ+TAxC6Hvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbJuNAE9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbJuNAE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708635482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uQNCPPxOXSIi1YvPzBU8stcQQepKpFfnl3c3A7lEn1w=;
	b=YbJuNAE9WZkNm02AAbMSlKkubE9k16ffYmbvHh6Awn2Q7fdWU3SBCGvRTfydpxQN5PnUAV
	SmSFmUMM+KMHUNg3KRVJBGDGGKXo7Oyh3wpA/VBav/7W5kRuxSajIXxG5ew12MwGAcRxnj
	gn8CKhQqBHr+dt2lzkf5z2odTJw8LZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-iPvArl2jNXObXjSmQJpj3Q-1; Thu, 22 Feb 2024 15:57:58 -0500
X-MC-Unique: iPvArl2jNXObXjSmQJpj3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43454890F64;
	Thu, 22 Feb 2024 20:57:58 +0000 (UTC)
Received: from ibm-p8-16-fsp.mgmt.pnr.lab.eng.rdu2.redhat.com (unknown [10.22.8.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC3EB10802;
	Thu, 22 Feb 2024 20:57:56 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: ilpo.jarvinen@linux.intel.com,
	shravankr@nvidia.com
Cc: davthompson@nvidia.com,
	ndalvi@redhat.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Luiz Capitulino <luizcap@redhat.com>
Subject: [PATCH 0/2] platform/mellanox: mlxbf-pmc: Fix module loading
Date: Thu, 22 Feb 2024 15:57:28 -0500
Message-ID: <cover.1708635408.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi,

The mlxbf-pmc driver fails to load when the firmware reports a new but not
yet implemented performance block. I can reproduce this today with a
Bluefield-3 card and UEFI version 4.6.0-18-g7d063bb-BId13035, since this
reports the new clock_measure performance block.

This[1] patch from Shravan implements the clock_measure support and will
solve the issue. But this series avoids the situation by ignoring and
logging unsupported performance blocks.

NOTE: This series is based on latest linux-next which contains new changes
to mlxbf-pmc.

[1] https://lore.kernel.org/lkml/1c2f1b6da51523fe0f338f9ddce9e3903148f604.1707808180.git.shravankr@nvidia.com/

Luiz Capitulino (2):
  platform/mellanox: mlxbf-pmc: mlxbf_pmc_event_list(): make size ptr
    optional
  platform/mellanox: mlxbf-pmc: Ignore unsupported performance blocks

 drivers/platform/mellanox/mlxbf-pmc.c | 56 +++++++++++++++++----------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.43.1

