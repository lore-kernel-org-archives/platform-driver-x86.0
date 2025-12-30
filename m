Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436B22301;
	Tue, 30 Dec 2025 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130811; cv=pass; b=cDFqEdbywqQKHK8RXucHBbidfCCtKmj8a5v4m5/17f+t+L9q6Qg3Gs/Cfe+M1uzhApN4ttbPkTCFsD5MJsCaN3WzR+Wy9bNLhqfiIIB6IKvhJf2oEku+gdRQtcB7ijlDSam/u2CeumIrhqJ2Ds13UtJQamnL1QoTPB7VTqScnQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130811; c=relaxed/simple;
	bh=q3qt+AHp1LgY3uLdtkGV1dlrrIc1qjbyc/fBi9O6V7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tw/uenAdDBvu7hwaI2IrOgCnIML0D7DpAXIooLOEyb+QUuvFhBOnqfdfap0Om5dGEhg0bJJMlPNCu8IdLK9G7pL/vqwUJgBmCdwIEOdz5DIMZX/xgg2NivroKE2SXfl/d3Ghn9+synIYoSkjDTZ4soYtJzn39RPGz00GquTNhqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=etIcFiRI; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="etIcFiRI"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 7CCD5109D6C0F;
	Wed, 31 Dec 2025 06:34:37 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaslHGX1Zb6N; Wed, 31 Dec 2025 06:34:33 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 78F59109EFAE2; Wed, 31 Dec 2025 06:34:33 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1767130473;
	cv=none; b=xZYqt2W+ew38xWK8dY5wpKEJh8TuQJWF7dzISAR9HTb8I+LHRGdZhlqDuvspMNPbVZnIxmbNmsaUhssixuGf/XBwNYIZFOd9GbXaZ8sE8bZ+k8lReGyazgZ7RwfnTwIWNAV3CEqv04Zmq2TEde0q9+Zd/JCGN50jvJQTWkWab2c=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1767130473; c=relaxed/relaxed;
	bh=q3qt+AHp1LgY3uLdtkGV1dlrrIc1qjbyc/fBi9O6V7M=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=DiXdc/Ankvty806Fb3BMM0DmPQXUItbJi4Ghd3oYnboXa3W8LGM6vwO2dn3K4A77sPPs/DPf5DRJJ/0ltFk9g5pcdxdJ9q8FcE342unuoK4Z5c1VDxFSjhjNRDap/yKqXet5HfnXX+7NPNQoup1ayWRnn1tcj/NtOcmDNA+4g1Y=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 78F59109EFAE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1767130473;
	bh=q3qt+AHp1LgY3uLdtkGV1dlrrIc1qjbyc/fBi9O6V7M=;
	h=From:To:Cc:Subject:Date:From;
	b=etIcFiRIl+xV7ec/PhAGdkxEZFyyKoOYUiqUQvdP4qAGtfjTjkXHNWIDTqxBjJObl
	 eOp1yN4PRROhjmAtgF28bkhcscpedZLWra7psIPvdVXEv1dWipK/v+yr2fqRc3X1Q+
	 mDQa674Khp6CoVznN6hws4a0TCIhXpwnBvf+TPLg=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2] docs: alienware-wmi: fix typo
Date: Wed, 31 Dec 2025 06:34:31 +0900
Message-ID: <20251230213431.656106-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a typo in the manual fan control description ("aproximate" -> "approxim=
ate").
No functional change.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Document=
ation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
=20
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` v=
alue
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
=20
 ::
=20
--=20
2.47.3

