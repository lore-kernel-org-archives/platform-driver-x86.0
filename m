Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE129405;
	Mon, 20 Jul 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553580; cv=none; b=lL8TIa4zIzT2AQkrbTDjFcPAX/0pMIVJH0AqPcybQ8EjLFJ7hoGbQzMifszXy4Kjy/BW+NfzQibpeGuMhdo6jDGJzcckL5lPYSAWPcPV6dgTP38QuHhWjgTn/hDq0/e/057OWPc5uvATSwb4ETmQBlTUZavKc8te2T/3u89ss0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553580; c=relaxed/simple;
	bh=0f8uSPMT3vC+Y1Oq6mySDP6ZcQhVKNSgAnAolPLC2Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OD4aYdVUkZ0QPIIyw5FPPtXz18PpzSfVav98TqeI1Cy9v4bcjun6wFgiHYrHpAo4jXE6RZ27Lgzt0AFtErGtg8nDp3msrd9fwzdDobVnv3tl2Hg+ohGhv5Oozf2BQG2jqN92vXUkRFbLa0yiY6tKlKztox7ZR6GPhG+x6OrH+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jfBU8S5V; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jfBU8S5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553572; x=1785158372; i=w_armin@gmx.de;
	bh=g1V5+66G3DVRKArD+ochla3c4XGB/CzJ5/Lu/0XExMo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jfBU8S5VDZiaCZuC6LqHyW30Dgvl2Mi7lHZh+M3KvTiD4NemQF3Lr7fOy9pJ9o5L
	 fDwqoUPLmNjghnXKbPuIVqek+kyeFZYrdTqj537RfmEWdc0v34YoO5eD6hriIRa6X
	 0ZmzlGO8fknVUgBy+U2YH5dCpcvkKpwTSVXWoGGYNZZ6TF21HVpWgcoNqN3UgYPFJ
	 +K08Exp4aazPasrA4BJSPe0B+HpqFu5MNxs7KQr2tVFRpvnJ/wBsTn5Mto19mpgp3
	 wU5DYmZh7vakbYrF1OLsTN7RVhHl8megRqbN5wCI28pJQNsfivZ03ZW2jYossm0mU
	 YSzKwrd9rHLeo6Nwqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1wegN43aNG-00C9GV; Mon, 20
 Jul 2026 15:19:32 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH v2 0/3] platform/x86: dell-smbios-wmi: Fixes and cleanups
Date: Mon, 20 Jul 2026 15:19:18 +0200
Message-Id: <20260720131921.368000-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Iz6nNRP5F56hf6Buf+mdaBh1AWM2fxOQOMFwOMTvgpbTa59suUL
 zltVMIfBqrpjvrB+AQhma8HuN+RiQJQg/3N5sinxF66JhhM0WWHYMWq/8XQf7FdQnYIYgPd
 39zts/jdysQ/iwuRy9qUWMDncYgCnsR8lCXPFuluO1Sb/IIfJGQvX0Wh/xzDi573RyJTr4O
 /uXov3zYbGykEEjbiDElQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kyy9/JCDa0Q=;BzL50eG1fvVWMvsHENpSBXI7F3k
 haXY6fqFWqJyOMea6ZSm3Uo6cRp/amKbtkBROIgg9RRFnkrexCgLyZTH7TpPeBvPVLLNFFaLW
 v1s1Vl+nKmz7zMcFXZUw/NZrGRt5PB2Lvu7Nplp3MKqcJsgeBLACl0HbEdttYUOSiOpNRlfhX
 j4QnqqEentY1WHMJqYgThh9rTLAEvnQfEcHTGj7t7BN9JUEI3H1tlPUDLtehXE7e32r5rMMf0
 lG6AWl71Z+kRzS7UHWDIfMFzB5tBGV5wwHYqSreH8ROdrjZKL4PqO00umbefo+Lf2PtDlHBou
 C5Nk2jya3Z+L9TfWihyT6tcxaQCNbORj17U4Jv9Fm/4LPa1Cjwt+wiGt2ARqQtnZWVShzS6IG
 oaF3ARivk/8rfhv3iZfDaqqL8hVnw9ksfbxvVR00p0V4NYOz5r7GwNjNlQCdyNMi2HquWg37j
 37xZuNdET+ms9YOHl00iw4mAEExR+1a3yzbsMYhs+MCsvVu46426mJl4KFWE/lmsxsZ0OktQe
 UXcWsDgM+lqDnSuxtyHipO4IM0PHF8Dj4KDsSbBpYdSEO8cvlVfXvX3J3W7/YJCe/Rc3bvZVR
 JdaD/8zbewtKWt7a/J8WlRJTZjkZLHHRpmqHAA3bFPTD7nvCM6MNApGErrd251KiJGIH3mV1x
 2srxsXtDFWkbkLnB3V6DNYCI3DkmF+SkrnS443+6rR0EfQ/ZRPQ37uNFHgF7MFj/tVt3nZPQF
 rx7YITLcI5IBNSHscJxEhO68rC61HTq6Q9LlDKbjlF1xkZF7aBfFeGcUgR6ff3OZQUOSV8lYM
 AfFeex2AjJBwHtx+YB5anXZ3urGBPf76kcAhkBPhT1oYBOFwZbIcifmbn/EvBqy51tOyIEJeq
 sRZoV7RIq+tqAkat9o7NFXcBK83N9yMK6ZnZ7hfze5MLOTJqs2wNYkjbV63lT3zMfNPDm8pm9
 DnsxqJMhyu6OIMukxAZmwaoUkIaDiAK0Zq2XJKO11wJ+MFe6GV1woIbI8HIntRpHqypnhGzon
 /OZHFO8647PO2XmMLy2xXMPYg97t+Qpxto7bbX1kCTO6LE2hJxYYvR8M5f0AG1hQU4HiESohL
 IoiqWrb6Vk4URg5NQlHDeriOXNNLkRV9SkbYWevozM7QJmr5sSLaHaJyIG5esB8Q75DN86PDb
 i366UEkfCzAogY7Z1+LLC2s8swDBZySgg6LpXcIeKXfgj3dvHJz1O25N/EMwYjdw7r4r3ZBAk
 98HtdPdSZy5qbEkywltSlxB5wzRP5u4ORvVlcxmlA/Dfwt2WEd0xKJyUBQYFV0sQgLDm8G+Ko
 706S/nh6CgmobfQ4gXm2VrJv08OQ2RQzerR+i8F3nfq0G1N498FBtTDCi3D3qTIkNj2U/QUhb
 R9d6Ufi7PEdauYfsRtqp7flIeqXZ48q3cyv3yL+hmlfegT9Zv9R0RNCXni2xG3sQX3LLOyhMn
 F3pH9rVAuNJOYDbvhIB1S7ygzHcrJj0m9HLgXsIGQ0tbvM1X9+PwHXSYDdPBOCA6Mfu9lKfAQ
 CV1ZRIptR12wkjFVruUtsUL2aL4qnIxyPUPXiP8Fg7tg+ZjYC6OHTlXD03GvnTpEWIdtlImBQ
 fydH8IPv+2yLYgYWO5BBwANuP5RSIYt5PSZvBHIzzT3UEhA2Kr7gs3sUXy4+k6/88NCCvz1wI
 KQXbY02fiNvn+e2KkkAYyJqSgkEXGsHuf4hw7Fa4Z5vuCXBbcFS6HBAruNWKb/Xz5lDMc4Swf
 wt/EkU1nOm5JILAtp+BkzY8knTYT13/p60bKyWlXVtxMr6ZNDHpEH7Dzj4mcxIZhtz/oh/yeX
 sURP1IxdjqeWBGNeG96ad/S8ch9yp+Vrb6HkvNe9uYpzsHnXPVPojiQbC1j66LnxNclXjgBuf
 MvQB5p1hqeW8XO63hNfo1f6adfGnzEEJ+0qgCDsswBaLu7ZuFg11ApatYeffCctsOeroUrug6
 ArrYcJcwrfmf4hS/BgTVIyAsPKweRNAB+3e+lW/iihADorv5nY7rEV3PpzuSkIOSwWcevo1bO
 ZN2QOoao1YBBKuY0DdKeyOjmBX4kDWDhzmngaGaRS9KM2nfa1E1rAvazHS+tHuZVpLe3201dt
 /9LJTK9hm1C37xGBwNq3od+5BzT4qxY07KXXACRBalk0S1gSaWDN0DiEh1U9g9+5SEOGS3z+V
 NfrEWzOeFK3nDG7mBTotaFOhRPTQ0R/yUy26QBIkLB8OYiT0PIryZR/axq1WRSSS0cbCROa3K
 NlC+3iM5Vo4hwu9zbfCgvl5pJyjsAZj/a81D4OJwHL1aR8g3ygR5pzb/l+fu+Ceq4wcznPH/Q
 uRGPrksCROu/XM1g7o94lZDjAveguANbRaLeEcphwaDqXfoq2Br2HrQ29zLlSbJmAbJNRm8aV
 aieoD8ewClmbFOYFmUpYBF37blHrxrJAqCgg2oYCjciyNxyf1dGbxTMLjQfC9MNiGxyYRNWQZ
 v6MYaL7jD8EsxWhf7h8UFL2Kpbq9AMb8/qnaj+Le+egMVn4kmPfjkQK6ScaM4L6CL8mLRDJTs
 46/YYwI4/WmSqmQiPsbOEotf50JQHUleweZWxjoJ4LHpUyVs5LqaRsvlNl98DGrglvL0f/amv
 kl62KP2ocXgh90hfAd8dry150Vmb5G/cbb0MiOAtyxmDjdhJCO/c36hs1LTK/g4TBlGrKb5QJ
 aDPE70qZuoq4D298NfM8fCdmhrPK6tRWGIuDXa5T7ddEx0Wd3dGfC3NvGhqQWzH/de2HF3mGU
 9JKFytuPoIBPKx1WBhMMg2X0RAGtdJxJhLBGTAZLH5EnbFdcp1sVSjFYcst0OV5oOes6MW9oy
 eI6UfZLSWV6KaIThllAzNNh49hIo7ajL3dE8MUPPfK/rEvm2f90s2HqvvdiyOp+WKyZgbMlXw
 56qe/TAELifGtLGHtMg78nMxZJ/ziLAp6ZAgbXq8FEs1UJKCNxr+onOuKnfBOAgkEOy8Jy4dZ
 uZ2CmslnyE2cwbqOjYO9fBnpEitQVKhXHqOw6nFZ+58MAmWNXH3thFRxr4tvkOY7p3r9PS+1b
 uSk9kjHd4yswKxTJ5B/pPVX9RAqp2+vunISr+85Oy2/EO0f/AgLNb5irerzrO7VSNIlXyyFt5
 RGohT8CZtr8BQDpVE2ocWNxlnB6eblVn93mHXGk/mdcDRYtlO2jbIpMYNxxmamtNyPG78XXbm
 FuFw3i/nxSUwwWOpTprDIDgJzAoMQKauwXuFGmALDdKMWRGjSM1ybYlmgPPrFWwvReg/FNFJy
 NhZDpI5B4IE3fVfBhityKR+MxqIjYF5iMMYu43A0u82tut+nou3tcBykkDqom6D6yMu+VlcW5
 089cs95LiRk12Ix7T+f5p5vmxFq2YyRT7mr9PYN7SSZ9SaL1RND5kQmBYjrTziHE4aLULgLx6
 we9HmfBIy0VN54Ofe1tNX99HBfFRwCpMAHgluCLA0j3ejZZuBVGZqcqqP1vTQrkoqtrbWp7uO
 L+sFPihTLf2t5FV6eAEwPeRKOwqfjBBEaUg4YvmsLH1fvPjcYnyWfPlGuqyp/gossJKgudL/r
 2M5cT6Lt+uiAmnCq31HDdujPj4263Zxx+PVsxQnJvgvEJSVZO0bmarJoNtqpLxCpixc1ra3nK
 Ypl5lyMmxY/Hn3MxHfgxkkTdeZN60VBVlQz00G16XvEQN1mIfnGCvr1wloLJnxaqBH5P3CexB
 5USlauuj0N7gy6jLdO/ueZBnp3qDWHOu7Y0/ksGssUd7j3EZAEMySg2jMJyWEcJmux29PigOU
 h2y79U7t3eJ0zGJmMcdpU31Ix0J921bj+9Amp6fznioMyA+OHoIl7bgMA5PW/J5EYjzNIuNTg
 EWIPCAH4K0bOev4X8qF6B6UYa7AwXXd8b5QeowVGE4EEoOvLLpEazxcdgJ0r+OyQSXHDzQpBf
 +T8VmmPgWU2HvjpzYTcoIeAQe28OdOdzD4o/JcXuDlAtctlLttjLRObWa0TKVFQSoNxY89J8k
 JVmL4sBzPc3niVRw271d0WIjzUS2mf+K5EjGw9gEAI5OZ/nB830BM6wlRCjN5+NjK8QA74HXu
 omoYy7t/RFcEbp1J3gkQnDUQ9Z7CPAQcE78gSvdDlL8eezAjxobZIJM0xAEhum0uv1/MwK2Zl
 HFXqqYLABrmuEwTwlOFQO0N8gvuT50Uft00cmg8CX9HPh0AJmetFGIk7kV+EhRtJWe224udz/
 LKuxI8Sg2qerRUMpU57YzWDSNkdyIsrh7rPS9cRC61xg5XJMCcNePwIePg4SSqt/FDkHaQLln
 Vc3T0wxiHxrSlbCmb8G2BTgUtfNSULYPTWbZ+iji+xMIqv2foT4jX9gVFzfTmdH5rB7WVJwOI
 CYfBWgp9CpC/npVRN8IdNI0uAFe1Q2yzKCS3e0W1mZB4ASPbjzONUGPB2jAP4OxCxNitRHwso
 b8zMl4aJl2oA6PRlgYf5OulCVHAkxfg8mcHqL/HK9Svkr6TK6UrnLHMz45ab/rSL2Bk1+atmR
 Wgv8pi3XcV8It2wO1U7j2Om1nUDeq7FYueIiIYmDHl664fb4ahMNfR0P7X2RQ67oyOQWu1QyX
 jY0TEJ953UtdK00V1Ka3BA5mmnsV5R84AvUhr1AMxC/TGF9qpl7heKsQRB6NyAHo5+Q32yFap
 Y0WFdIlb2eL3qH1c02pI1AosbkZ+6hBgWes99nYxfvjc0DbQxEFEDDFpAfHBmKVUBs/W0ewp1
 gRlcbaR5h4qUcREMTfnv7K7BvTmX74YmQx+mON6IURrDdM5OOogEOUmATpUOs7iyedyamOcA1
 8n3rNUAqQushFc6P5xLNGVoeiKu3oiIy81bhW4OVrbvZlJG2251WwFXzDSRKxpkLGuBs+SG+r
 yx2EjdlJQMbPUCRnKA9hqvI1ZambjbJMbsrML4sJ1/84h3je+v/b8LyMR5DA19IyCcG6iyCo6
 YAxgwfAFmg/lKkg4PyPvxUJykNLZaAQWD3QgIGxI0SR2pUT1eEawCBc0g/kTI5+RQ5vzoJprX
 gAmyo91QlOmQ0pEORWZ+ppMONjcZ3xvXmyR5yPEDrEHjIxlTRrYkYJDUGLTC1/lIeTZZLR96S
 /ngqHBoOz7pG6pBe6QHT/8uwXCC1KX9uqAuAUvAd9CSWYt+SyJmwezznkNvQHE1LifHXf1edX
 z5zYSKkLzLU56TC3J5PTVpTjQ425GATYbugpsGHUjWn862R2ad7kHca4mFhRjTPxDs1uhuKjm
 hx9xayMwxoUGoX3PNh7713t3727dwkC70W9tHNr7z8kGFjQheSfsy/NHnQpShJF9YRaD0ZNSa
 W6fhYsr0XoQmgq2f9zXHcrXlLFKnh9iNs1PrEVGJb8DhTSFGyIa3yC91J+ziyP2dEXIwKd3JK
 bgy+4Q/FwYnMHa+DPizZCs9qn+g3EbATIzjnkUMR6YTR97Q7U8PQvFT9j9TdBVPIZ51CkM67d
 iur5buhPd9O2xHR07BuKhn5OBIFpI/t9QjnQRTJPyBOPjkU9aSU0L8RZWFsg/q+UciWh55Qfi
 9Pg41ZjjRYdur6xcw107b3kKyDg7gkbkIWTSUy3slIJUcG6WwR4ZKF2Tv6r/sa0ZwvSCzR/GH
 PSUxCTE87xOEubmSVvNvwKv1myI=

This patch series primarily deals with a potential UAF inside
the dell-smbios-wmi driver reported by a user. The first patch
fixes this issue, with the remaining two patches further
cleaning up the resource management.

All patches have been tested on a Dell Inspiron 3505 and appear
to work. I also verified that the UAF issue does not occur anymore
after applying the first patch.

Changes since v1:
- move the rw semaphore next to wmi_list and add a comment

Armin Wolf (3):
  platform/x86: dell-smbios-wmi: Fix chardev resource management
  platform/x86: dell-smbios: Pass device to callbacks
  platform/x86: dell-smbios-wmi: Replace global list with single item

 drivers/platform/x86/dell/dell-smbios-base.c |   6 +-
 drivers/platform/x86/dell/dell-smbios-smm.c  |   8 +-
 drivers/platform/x86/dell/dell-smbios-wmi.c  | 101 +++++++++----------
 drivers/platform/x86/dell/dell-smbios.h      |   4 +-
 4 files changed, 55 insertions(+), 64 deletions(-)

=2D-=20
2.39.5

