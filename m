Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884155;
	b=5PE6Zh3eI0Dm2E8w9PSucsSic2JFMBXxfDq0v0JPf//VzP1YGhJye7u9k9Ss5wPgot+a
	 swGUazscdAqpraprBQlwnqlEChoJ22WGKkpvw+lWx3y4H0tJQSGA5LL4Eu35lRS377edL
	 CHcLL4QWdHAppCx7eMjXYRFMa9y971l7RmZNKaKGGpAujk91HDOaw07syIYKMcsWT97Kb
	 Wb44Xwwl49y/lQ8wI66OifX6z+Xu34HUc/3eT9rGEc0WBPU60xT3z95BwVlZMsdvdip4M
	 578ibHVRz5p4JfoOUMhvTQGqkFxHa+OJeXVSOg7f8zbUP88u4ZvtIcA3ftBpb2AZxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884155;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=nKqS9ZMsRahIHs0QjU6Z8mMtCqLyoSSe36R37iF6B38=;
	b=UDQ3Kt0MQw+cq8eVpJ0X2mTgI2HKF/EWTiKCbm/+nve34tZeQujdzC3fqNwVJYPfKcFz
	 eBVTFQVgIqRakj6SMcbrSREr1kX8um49Mad738s6Yl/UD02pHSBG/jtZKkdJ0qBcA1XUd
	 NJvKi0JouRbv18PQVESiXrs7Blo952v+TldrUcrqLCVXg1qs1AfuGym0m3HIPfbBjEv79
	 1dbpu/IMNrIQ1HXNbelO5Mi5gzQi9SB8Fv2t7kJcdSZVgRFeFPCOkAXNmHX8J+kyFJJl/
	 uy/Svv/UdBbztKEuJ3b4/rknDO61/kPBSuqovKtZN0cXPUb6fw//cjRbOA13tx2Frow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrCJ+9KU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660D606A31B;
	Thu,  5 Nov 2026 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NrCJ+9KU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3CF1F000C1;
	Thu,  5 Nov 2026 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884154;
	bh=nKqS9ZMsRahIHs0QjU6Z8mMtCqLyoSSe36R37iF6B38=;
	h=From:To:Cc:Subject:Date;
	b=NrCJ+9KUYB/7NPm+exFUKkv7HOVXzAFHLdPPqmNm0wFD8J6oNAfzm8cXLI33aJaHm
	 vlzrFG0Y3+OxG8FytpVmg1r2rYpaxU7+/MfVenbPegPkbZsBagHW8d2pFNhP/0FbBZ
	 d74iatEjPb2whsSxPNpoRbNAX10dU0cC33skX4OlGLeP9aLFHNTF2UZrrdg713hu4S
	 6VwnB8qUoVAmpOnA5V8HgqyrhObD+oNwDtK71P4Hl8HSowHM/eJdkf2rB69h2neAFc
	 T7uH5m4S4grCGCaDVcsR3HJA3+2W9TUpVSXT7xn52gNJrQ8yaYWls5ZwKZGFvfjzjn
	 hZiqy03haFWXw==
From: Thorsten Blum <blum@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: apple-gmux: Use guard(mutex) to simplify the code
Date: Thu,  5 Nov 2026 14:08:27 +0100
Message-ID: <20261105130826.345690-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5005; i=blum@kernel.org; h=from:subject; bh=tt1H0sM720f4VaAxGTyX/iYAw4iKCiB5mCSt9KeFngE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlv6k/93K4jxP+nsvy5TL75xPA3D7KllvV8+sKz1svqx NoSx5rjHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRJ8IM//R3q0no357zYu0y tRv9G5VXX3IzOr3/v1AjG9vRJ6Z3uP0Y/nD8YvcLqo9isZR7/EE0+bTdTHc3nek338Zzx9sWKEx eygcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use guard(mutex) and remove the manual mutex_unlock() calls. Return
several results directly and drop the now-unused local variables.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/platform/x86/apple-gmux.c | 48 +++++++++----------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9c728ac4e045..6c7790012011 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -169,41 +169,32 @@ static int gmux_index_wait_complete(struct apple_gmux_data *gmux_data)
 
 static u8 gmux_index_read8(struct apple_gmux_data *gmux_data, int port)
 {
-	u8 val;
-
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	gmux_index_wait_ready(gmux_data);
 	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_complete(gmux_data);
-	val = inb(gmux_data->iostart + GMUX_PORT_VALUE);
-	mutex_unlock(&gmux_data->index_lock);
 
-	return val;
+	return inb(gmux_data->iostart + GMUX_PORT_VALUE);
 }
 
 static void gmux_index_write8(struct apple_gmux_data *gmux_data, int port,
 			      u8 val)
 {
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	outb(val, gmux_data->iostart + GMUX_PORT_VALUE);
 	gmux_index_wait_ready(gmux_data);
 	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
 	gmux_index_wait_complete(gmux_data);
-	mutex_unlock(&gmux_data->index_lock);
 }
 
 static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
 {
-	u32 val;
-
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	gmux_index_wait_ready(gmux_data);
 	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_complete(gmux_data);
-	val = inl(gmux_data->iostart + GMUX_PORT_VALUE);
-	mutex_unlock(&gmux_data->index_lock);
 
-	return val;
+	return inl(gmux_data->iostart + GMUX_PORT_VALUE);
 }
 
 static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
@@ -212,7 +203,7 @@ static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
 	int i;
 	u8 tmpval;
 
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 
 	for (i = 0; i < 4; i++) {
 		tmpval = (val >> (i * 8)) & 0xff;
@@ -222,7 +213,6 @@ static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
 	gmux_index_wait_ready(gmux_data);
 	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
 	gmux_index_wait_complete(gmux_data);
-	mutex_unlock(&gmux_data->index_lock);
 }
 
 static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
@@ -241,24 +231,20 @@ static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
 
 static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
 {
-	u8 val;
-
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	gmux_mmio_wait(gmux_data);
 	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
+	iowrite8(GMUX_MMIO_READ | sizeof(u8),
 		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 	gmux_mmio_wait(gmux_data);
-	val = ioread8(gmux_data->iomem_base);
-	mutex_unlock(&gmux_data->index_lock);
 
-	return val;
+	return ioread8(gmux_data->iomem_base);
 }
 
 static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
 			      u8 val)
 {
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	gmux_mmio_wait(gmux_data);
 	iowrite8(val, gmux_data->iomem_base);
 
@@ -267,35 +253,29 @@ static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
 		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 
 	gmux_mmio_wait(gmux_data);
-	mutex_unlock(&gmux_data->index_lock);
 }
 
 static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
 {
-	u32 val;
-
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	gmux_mmio_wait(gmux_data);
 	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
+	iowrite8(GMUX_MMIO_READ | sizeof(u32),
 		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 	gmux_mmio_wait(gmux_data);
-	val = ioread32be(gmux_data->iomem_base);
-	mutex_unlock(&gmux_data->index_lock);
 
-	return val;
+	return ioread32be(gmux_data->iomem_base);
 }
 
 static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
 			       u32 val)
 {
-	mutex_lock(&gmux_data->index_lock);
+	guard(mutex)(&gmux_data->index_lock);
 	iowrite32be(val, gmux_data->iomem_base);
 	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
 	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
 		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 	gmux_mmio_wait(gmux_data);
-	mutex_unlock(&gmux_data->index_lock);
 }
 
 static u8 gmux_read8(struct apple_gmux_data *gmux_data, int port)
