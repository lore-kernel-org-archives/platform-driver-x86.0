Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814B2D131D;
	Sat, 22 Nov 2025 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843931; cv=none; b=NylMSjW+2OAYXYGNQ8SxelEUg6bjCHNBrTduK+NbTCX1fjOlrxGiftqYbtoEpcbN1BW8XtCUBdmL1BlIy/MBd9gsfShTxOlkE62mPOHHI/JpgcFc9ulK+FgVav+9rI2KRqIg9BMPc1FJ6W6KD5zJR//gjzxNEgTlEysFn7mlijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843931; c=relaxed/simple;
	bh=2DfUyHkuqLKEb51ARcwC5O6fLBP/HO4ZWeKvEBZVecI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M9VcTeVLE3zaoufNNdwV7wo4fx5p0vgARvG7gE4gWIo2Ui7fZGmUPvKcx0VM4Pzm/HUOz3kWnXLNKDOAED4CkeHIh26UX3QWrEb3fnFdUMyze1x9foq2YfkyOeTjUor3aIYiZwjLLOo4yPmsfGrYuu8HnCFA9cJMExfeGtMHt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B49zNWP/; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="B49zNWP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843924; x=1764448724; i=w_armin@gmx.de;
	bh=bfYnzxa6sTlma+qjc+GSsPlCO2sXENhnw7i5MiC+Afk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B49zNWP/3NhoRMV+mX57jkB14T9fMoGP/pvkIG1ZPKfRLclCo/v2y/SlSrhy7bFK
	 hTI0gvaACdxsiBUGjvQAsdMucFHuc2kqlWPyy0GS2Tjk8NHvv+BAABuyyUAnAtFYy
	 DV0/8O9db5Iw9/fNtTfYroBzJCGUfRIaKxAvvcHAVp/SOVehVU2fpkMbswfChmRG4
	 tTGDBHkCwM+oVdH99F3/JjNXfm15zLZmucb9KUAQKe3QnhCL5nyIrjW+tBmMYdm96
	 c8eVAADoZHZq8P4yd284bDjYy6yAtOYPifDMbof8sUEMWD23vEZBQfr86I+6np01j
	 g29JpFREyI3K4pmocQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MZCbB-1vaT1W3MLR-00RAyT; Sat, 22 Nov 2025 21:38:44 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 9/9] platform/wmi: Update driver development guide
Date: Sat, 22 Nov 2025 21:38:03 +0100
Message-Id: <20251122203803.6154-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kanzDpoTBZKfua4EFt73RRUOo+OWWArqxAVf2aD/oEo4b1hiT6y
 x/a3wT/KTT4CSRZl0i5R1S7G0if1oMGNWIkaVIzySD9s5M1wu52exW3J7jaMsWjzEZ9AwMM
 qqeb7//O8vnFzg66Cz252H0cTaa292XGgAdBNHfoeNJMa6YMO+xUhwsPbi7NIqx0M4FqcvG
 3a/g9UeK1dm703QGg9JNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R5qILLG1uc8=;K5JPWKlr+PSrVaj1fYC/v6FYog+
 +d3m4gJlpNJQ4GupJIUdgMrBOVdo1rpqPriJNoFh2QmrpKdY1JCL8/WxQjJonyNyXSikFw4KC
 NyoWZoD6lZaMK1pJgBXAjUrzzGZX/vvDOvu+ThuOE95I/XayYIpuoQ/H604nFxn67GKtAtAmy
 EuTG3/UUTcuDmkAQTcpoMurcj68DD5LMnad900fMJ8IU+br5JmF7V+qUBiPbmkYDNBjuKlTJO
 uGNE7Jq0EE3jth6IyjrYJhJNWiZct2BUHb8mK2EE5Qn/Z3C5+qpw50vPBDK0kzjw7w+4a0Hia
 3HzMqPL0TicxJX+8xX51rcPCpp0Fpvq78dXAGdxcNz1/flQ4trJsq6h8/CXjIRI5OOO9/q6Cv
 PlY/CETB/O6jPwMCa0Gh9G32HCKpgGi/PhxMvcP4b37krn51MkpUDRFhfLE+qY+ZaMMoly4Um
 7VFyYte5UocuCvReCG7E5el+hIukldqC8WaO3qlhzzse9xJtpMlSULO4ais37PaWedMvQ4qdp
 M7nE9+FimB5oXdtdgJ2CilFBxtPTKij9Of4b8BowbmO7R8XdOocczxn3PD5O6SCYCT0rSbfmU
 I1naipz4809JI+I/nXx9hSKQpCYGnNEcEDX2MTD/9ugBq3vEWXNsVyzRrJFliBVbioyrRfMMO
 UZObnx+4Py0u5UUecTWXIePdFgMcJ8o87nq0EC1YlnIXTrdAHcGrFb0N3W0BkrJSMlavtYB2L
 8d8pKMCpd7hwXHlQCVKxZsFT7SQ33g8vl2uPa9aDXaCyakMn+AjnYx7Ep4f6d+C5j1KEpbgRv
 jW+3BpDcHOqXUMEPuKGo4gNLRF4QO7m99Nyc/64tfjD94fw6DMob8sYx3IBiZPebcIQWNxBAC
 BACmc24WjYhgv5Bwa+7SPhaIhEO09UlPi1TBSAAsG8nkmKjRkh6UNeDTTolgeUJq38h9jJQxI
 7sEMM1i7EYYQGT2GxK/EJEkqWOiOfsyGqqlERN4QHdAAA/GY7QDC+A7+hFp234k2BVUdbalGI
 R1E9dabyO0sm3hcmjO7vyKI7bBSNE8hExunkRGRUm1e3GGFO/yCanVtg0boTahk2V0numq+Yr
 IaTaTVqyJukRRhzmU9ip9vQJacUbUizyKuAVQ/rfxOO4CNI2PsMLODHpZONrp22S2EwnBa0WN
 gkuhyJcFYNFm9dFlz3sfoImaS3UomC6bfx0K2btVR4llmi8CqTCm69l0Aez0Mebo8pTlJZmYD
 Mqn8MuVvXWs7VQRgN0y+yaVe0AU9dEZAEGbkKRjFElTfqjgEJVoNklnvcEtWxzOMtndeaO0Jo
 GIJvKMi/URbDKwNb+IuvZsAVY1ZiEQYnkB/3beHvWOt6U6Rt6+nHaG98vwElVH0CcbJ0HIl6O
 Z7/RIJV1ChXqNr6vcoD9elCS2fbS31Q/mnfa4eJj/da8kPy615pBdqm99vDb+F4RpgB7VJeyM
 PHSiWL0yHMNbCWArUII7oxG0MbXuJ54hqgy3Dr1s2UMkm21JNq7omqc2+B+bsi+7as0ScY8Ht
 3t4fPk8d2owZlDXJgI3aNxjy6hOgKuetiC4HAhOT5nCFc9NOP2C0mTzLWQC8zVvxHH1EKi+yT
 QJje9ijRiiQRHBSjZ6X6KIqLTh51lM5rxmo2yHWb9MQQHCXNRsdSgyTg8P8BEdbF1C0HLGcYL
 8d3r9cmQMLNCD4JSb9VjsZ6VYj8YVcl4dWKFm/Gtjy2dEs4sIYQO0j1IRPx8oqVAiVCKccDWw
 FWASFdsHhVo7Hl2ip8YLjtwMwfFrmibTWMoPo7caWi5O5QwlxqzAriI5ilG7lLIw22eTKPfmG
 Xx60tYG1GtDcREld9qbHjM2zuUsBLoPonrQnRAqDqlshAOAajdgarHQLlmF179LJ3zRQAFyLw
 Vo11CcGxWAp1bMRB5SDQEha/QygirqYyo2byn5RhI7bJdLpFIngHhhZVAsQ9VtovK1DhUyUsN
 HDXf3qwAH+VJDV0N08zrbkFCKfJyrzLfq2fOPoOwUC79SsqO8c7Fwn160VptczozeWZ+RkVBU
 lyY9JDnLk9UFY+DtXTq477a6uDwBHAgkiL5kTtBeSui/A6R7wFKBzC4hyN8iy3KN9l9oYsgYs
 3UwP/E7CgVs6onQQKDXDy9TB/jr0Eung0mFqsybaWMDFh0IcceRZK24uD/jaBl5ZjbejDUErz
 2D8HuopIW6FccC30lU2XZPy1lkGmgDJVYqi9iV/Vhd74GYttW9EsqGuZifSaiHCUf9pjbx/K5
 ka7reRH/M+dyiseN5VTiM9iBJTxHheAx3aKCirF/oQAmaKlV70FXVRqJBRr5tWMrPsYORl90V
 uGsHD8ONUr3j/YQV7bQcD7+rdEZ608IQRgjt0TYFrCThoMc3B1jtogNwgxlQcdWDi6RfoTNtP
 Dwa6/05Trnl0TfPH1r+xGZnKlmvk7S+kOefvLgWzHZ2HBvmNd++NpGQQSOtzNtMH4tV4TEjXl
 ++e4CbcPoRr4sv7eF15jeVucA+Vnp6K6ZvRDrI4OrGhICYG9t82c4GUU3b08NSVmFP9qeaCpC
 RLsPVByXAco3VhVSrps8U1hhTbHo2i4lFjokXOH2AVTijj2OgOZI8HWxb4Lgj2A45ro6ZoLYs
 MPj2McLcGAMNFs3uEgiuturUZaOvru5sc2NONi9kSB1IyNdhjbN8EFm866CzCxUsjUPse1I6f
 QLPVHnvh/wZJhMqzh0lpMyouFSek5rPpe+vE2dj8Onkhn8dd3Y6OG8CxRnYL2rkYq/kqRjEk8
 OtfdN9b420B9ij7OHT7PHL+xXo3loZDgu2sQIgnxOnQxryp5W/pZXXjH6srt7mFj+kh88N4cs
 MnHf5+0xYeFajyMyScn5lc72qOw0rwKXIqfvD1K05wIMee/B9ECS9uP/iHhfH+bGbx4T1zJJ4
 lqBzk+wtry6LU+5wBybu5Yzg6u3p8gA2e+cNt2iWrNukYAxfGxDrxxDI5ZDXnpIJgB7fi9oUy
 1nYc3UfQ9eoGTK9X44WC8qwgi9MvNVLk+xt4yK9Off2h6wSU7tUPvbtODbz0AyqOWFmV/o5uL
 0zx0L3yC6UB87MJqrBdw8TCYVdlUg3+4OuTruzzP0JeB96F2WC0c2BcVcLOkpoeWJEnFk0Ig1
 eKLzZIYciMPFMuWcD3WVvXuXgUFMVdFJILTCfwGVGQLx84HFYPZOY2pejn4TaEGq6WmMRKZuc
 eBzfH2YGMb8EJVRyxSwRjHpe+hjam5L3mleascQQijqbMXXUnqAlsFFXsTQG3tCduNPy/6xz0
 htIF2i+kIHv4ZUeZrmgbyZt5F2ny6lcXFAHWhErwKK1Zi4k+XoOe9VR6O9f99f+Vlw6yjgLEC
 oA2n9A7hXCXeira5ZD5BWn//Wo7x/ChpRXTDG5v1fnIaE2qqRKgN8/RpBBRrDVDxeYAdTqAKs
 lzIeHp2SXk6TZOgH+0svdDr4+XmHxhzMASJwQr1cgY1/7SlJy/G9tKHWk1RCtQ016b7ASVdBf
 xhPMJP119XE5VeqkDcl81cXgf463YHjXgxkb+64KzGuuV9aDK9JZjpGVxoZSV+pEF6AML5Q56
 gAbD3onqbFxS19MhLXcdhlzv9nCpMRZskAB6wBG3zVBMYf7k902Pa4EBpaci4Z8xhyhl/wclz
 nEe0X0+avtP4WiVjQFOhKPaU9ZHAZyRYoFp6iQfiZmPOhzYLNhICOqlj/z/KsVTw546SmeGXX
 4HTCTZgVu/1OO+9lYt8y6SBKcKFw5m8MXR8XMNwxwNraQeKuPtPKdrlmJrpxewwUYUrvJ8/BO
 eUbLXTLN5qHSCGNGkHHtcLr5IrUGmzDvLIViXUALJ/wpBGGRdjNjM7vJbYoIiD9XSsrb7vE9E
 Kf1dK4GhmBQtXa2dWIDnwAIXAK0PXW2cDl/7dcPcJbQxMucJqoYG+SaQ9yO8uzjddUAD9zAe+
 yoF85M521Slug0SSewdlSEuXQSG8dQlH9APOSYREQTEkxsUeH3ntYYYUB0e4gZyXS4vhtPoHr
 AMOYdySFB9ZfISgpFWwZderQayEk8QskeFSj6KsMEvCCUhNIDGsWWwqA2awUc47yCpCVhTAF3
 qWQDHnY8jxWk2EY80JhMOcUaeshbb3hXSKpomtyGgUzDvtkBlwjPoZwq2Jvga800ZQf12iTQt
 BrVcSrzDVaf67QPQbGn0gDkKIVSGywSv6leN7k1LCz51zwIyEj+n9/G98gcAABvOkCKplQdl4
 BappbqpSiyQaHsKXq503HPpz0/0r/bjQ1Tf0n3Io+JqwVsTgOf8El7t2Z252548fnhUkRpAUN
 cCGBHUNXTMVKTwXyIO2ZB/Coff8IZUUdk+ElCz8U8U0yutM343bq0WPP/szFXKFY6I+hKXaOI
 4L2o8gR/wI9hwdz5C0rwkQwJfrW86X3Rc6Z0/nlXOJdCpSg6/01oFnOAcSG2fVVGglYNDFpZL
 NCrND0sIFEqpCnHkMzPiivex2ex+U7jSB0HOcHY3R6sxakw/AonLBCDE0njgmvenjIdtv4axd
 haBfOnVDnkj9UAgRAYoT1jnzHKhR80TGDT3yJI5LDGxN6s0ifMfocaAYD/knQ/3PWs0mh1G3A
 nRURJ5+ZEzogXQWRKXRSqF5KHzPoRjHNzDCUKy+oW2n072eDuk9AqkgvKIyxGek3s5C14W1H9
 j0Ql6xY61SXUowljUYAzUJXB2u8hY5aeCaf4koEVbnlqXJeN7PLfBzLZKnNNcsOzJGMw5Z1zg
 0V9bGaGPRsuZjm9N0I6MFXnGDl93tNHag53jt05pmrevitytwdM0Du1XSG9Xcg7pzRBO+x8hf
 NtnUXBFuuyHWtql73c2W7gFF+bVpJaNObhWZbyLKl/mkdR8hwhqkA20pRwLD/c5fcr46562Ew
 ytDHL6W5zmK/M/yfI2q+QcIbrJRM/mF9Zg5RE8xFALK9dsI9A4OoObpy6wtWun36X55jD1VFp
 eqksKR5lQRvL9rEtIxRpaSEdWQl08CHn277numt65By8yRJ+4LaM1ZK2WUi0REHiQ9NNkjsdk
 TfU85TRmvl8S9r6kJoVqT/23GGEkB1a5i9R1Nag41Zp6m3ofZksffk/nU2S8Z8VzzqoyXo1D9
 MJeZGIQwcdzSVVavpdWlGLxVFjGP7yayi6ugMOAe6By1DoBnvU1mAjnrgbsf/yYnS2U+yd1/T
 eFFPXpI8HZHs3MMUnGlrLgmjaJvWeWlElFbo+/uCaNs6guubJNyLMtzM1UwJqNhNU9Tw+rGrY
 3QaAAs8L2ZTOZvMEC8ef92rK0YMVN

New WMI drivers should use the new buffer-based WMI API instead of
the deprecated ACPI-based API. Update the driver development guide
to recommend the buffer-based API to driver developers and explain
the purpose of struct wmi_buffer.

Also update the ACPI interface documentation to describe the
conversion rules for converting ACPI objects into WMI buffers.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/acpi-interface.rst          | 68 +++++++++++++++++
 .../wmi/driver-development-guide.rst          | 76 +++++++++++++------
 2 files changed, 121 insertions(+), 23 deletions(-)

diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/acpi=
-interface.rst
index 1ef003b033bf..6dad191ac59d 100644
=2D-- a/Documentation/wmi/acpi-interface.rst
+++ b/Documentation/wmi/acpi-interface.rst
@@ -104,3 +104,71 @@ holding the notification ID of the event. This method=
 should be evaluated every
 time an ACPI notification is received, since some ACPI implementations us=
e a
 queue to store WMI event data items. This queue will overflow after a cou=
ple
 of WMI events are received without retrieving the associated WMI event da=
ta.
+
+Conversion rules for ACPI data types
+------------------------------------
+
+Consumers of the ACPI-WMI interface use binary buffers to exchange data w=
ith the WMI driver core,
+with the internal structure of the buffer being only know to the consumer=
s. The WMI driver core is
+thus responsible for converting the data inside the buffer into an approp=
riate ACPI data type for
+consumtion by the ACPI firmware. Additionally, any data returned by the v=
arious ACPI methods needs
+to be converted back into a binary buffer.
+
+The layout of said buffers is defined by the MOF description of the WMI m=
ethod or data block in
+question [1]_:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+Data Type       Layout                                                   =
               Alignment
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+``string``      Starts with a unsigned 16-bit little endian integer speci=
fying          2 bytes
+                the length of the string data in bytes, followed by the s=
tring data
+                encoded as UTF-16LE with **optional** nul termination and=
 padding.
+                Keep in mind that some firmware implementations might dep=
end on the
+                terminating nul character to be present. Also the padding=
 should
+                always be performed with nul characters.
+``boolean``     Single byte where 0 means ``false`` and nonzero means ``t=
rue``.         1 byte
+``sint8``       Signed 8-bit integer.                                    =
               1 byte
+``uint8``       Unsigned 8-bit integer.                                  =
               1 byte
+``sint16``      Signed 16-bit little endian integer.                     =
               2 byte
+``uint16``      Unsigned 16-bit little endian integer.                   =
               2 byte
+``sint32``      Signed 32-bit little endian integer.                     =
               4 byte
+``uint32``      Unsigned 32-bit little endian integer.                   =
               4 byte
+``sint64``      Signed 64-bit little endian integer.                     =
               8 bytes
+``uint64``      Unsigned 64-bit little endian integer.                   =
               8 bytes
+``datetime``    A fixed-length 25-character UTF-16LE string with the form=
at             2 bytes
+                *yyyymmddhhmmss.mmmmmmsutf* where *yyyy* is the 4-digit y=
ear, *mm* is
+                the 2-digit month, *dd* is the 2-digit day, *hh* is the 2=
-digit hour
+                based on a 24-hour clock, *mm* is the 2-digit minute, *ss=
* is the
+                2-digit second, *mmmmmm* is the 6-digit microsecond, *s* =
is a plus or
+                minus character depending on whether *utc* is a positive =
or negative
+                offset from UTC (or a colon if the date is an interval). =
Unpopulated
+                fields should be filled with asterisks.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Arrays should be aligned based on the alignment of their base type, while=
 objects should be
+aligned based on the largest alignment of an element inside them.
+
+All buffers returned by the WMI driver core are 8-byte aligned. When conv=
erting ACPI data types
+into such buffers the following conversion rules apply:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+ACPI Data Type  Converted into
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+Buffer          Copied as-is.
+Integer         Converted into a ``uint32``.
+String          Converted into a ``string`` with a terminating nul charac=
ter
+                to match the behavior the of the Windows driver.
+Package         Each element inside the package is converted with alignme=
nt
+                of the resulting data types being respected. Nested packa=
ges
+                are not allowed.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The Windows driver does attempt to handle nested packages, but this resul=
ts in internal data
+structures (``_ACPI_METHOD_ARGUMENT_V1``) erroneously being copied into t=
he resulting buffer.
+ACPI firmware implementations should thus not return nested packages from=
 ACPI methods
+associated with the ACPI-WMI interface.
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. [1] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/=
driver-defined-wmi-data-items
diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index 99ef21fc1c1e..9019661180a0 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -69,7 +69,7 @@ to matching WMI devices using a struct wmi_device_id tab=
le:
         .probe =3D foo_probe,
         .remove =3D foo_remove,         /* optional, devres is preferred =
*/
         .shutdown =3D foo_shutdown,     /* optional, called during shutdo=
wn */
-        .notify =3D foo_notify,         /* optional, for event handling *=
/
+        .notify_new =3D foo_notify,     /* optional, for event handling *=
/
         .no_notify_data =3D true,       /* optional, enables events conta=
ining no additional data */
         .no_singleton =3D true,         /* required for new WMI drivers *=
/
   };
@@ -89,9 +89,9 @@ the WMI device and put it in a well-known state for the =
WMI driver to pick up la
 or kexec. Most WMI drivers need no special shutdown handling and can thus=
 omit this callback.
=20
 Please note that new WMI drivers are required to be able to be instantiat=
ed multiple times,
-and are forbidden from using any deprecated GUID-based WMI functions. Thi=
s means that the
-WMI driver should be prepared for the scenario that multiple matching WMI=
 devices are present
-on a given machine.
+and are forbidden from using any deprecated GUID-based and ACPI-based WMI=
 functions. This means
+that the WMI driver should be prepared for the scenario that multiple mat=
ching WMI devices are
+present on a given machine.
=20
 Because of this, WMI drivers should use the state container design patter=
n as described in
 Documentation/driver-api/driver-model/design-patterns.rst.
@@ -103,38 +103,37 @@ Documentation/driver-api/driver-model/design-pattern=
s.rst.
 WMI method drivers
 ------------------
=20
-WMI drivers can call WMI device methods using wmidev_evaluate_method(), t=
he
-structure of the ACPI buffer passed to this function is device-specific a=
nd usually
-needs some tinkering to get right. Looking at the ACPI tables containing =
the WMI
-device usually helps here. The method id and instance number passed to th=
is function
-are also device-specific, looking at the decoded Binary MOF is usually en=
ough to
-find the right values.
+WMI drivers can call WMI device methods using wmidev_invoke_method(). For=
 each WMI method
+invocation the WMI driver needs to provide the instance number and the me=
thod ID, as well as
+a buffer with the method arguments and optionally a buffer for the result=
s.
=20
-The maximum instance number can be retrieved during runtime using wmidev_=
instance_count().
+The layout of said buffers is device-specific and described by the Binary=
 MOF data associated
+with a given WMI device. Said Binary MOF data also describes the method I=
D of a given WMI method
+with the ``WmiMethodId`` qualifier. WMI devices exposing WMI methods usua=
lly expose only a single
+instance (instance number 0), but in theory can expose multiple instances=
 as well. In such a case
+the number of instances can be retrieved using wmidev_instance_count().
=20
-Take a look at drivers/platform/x86/inspur_platform_profile.c for an exam=
ple WMI method driver.
+Take a look at drivers/platform/x86/intel/wmi/thunderbolt.c for an exampl=
e WMI method driver.
=20
 WMI data block drivers
 ----------------------
=20
-WMI drivers can query WMI device data blocks using wmidev_block_query(), =
the
-structure of the returned ACPI object is again device-specific. Some WMI =
devices
-also allow for setting data blocks using wmidev_block_set().
+WMI drivers can query WMI data blocks using wmidev_query_block(), the lay=
out of thereturned
+buffer is again device-specific and described by the Binary MOF data. Som=
e WMI data blocks are
+also writeable and can be set using wmidev_set_block(). The number of dat=
a block instances can
+again be retrieved using wmidev_instance_count().
=20
-The maximum instance number can also be retrieved using wmidev_instance_c=
ount().
-
-Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an exam=
ple
-WMI data block driver.
+Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an exam=
ple WMI data block driver.
=20
 WMI event drivers
 -----------------
=20
-WMI drivers can receive WMI events via the notify() callback inside the s=
truct wmi_driver.
+WMI drivers can receive WMI events via the notify_new() callback inside t=
he struct wmi_driver.
 The WMI subsystem will then take care of setting up the WMI event accordi=
ngly. Please note that
-the structure of the ACPI object passed to this callback is device-specif=
ic, and freeing the
-ACPI object is being done by the WMI subsystem, not the driver.
+the layout of the buffer passed to this callback is device-specific, and =
freeing of the buffer
+is being done by the WMI subsystem itself, not the driver.
=20
-The WMI driver core will take care that the notify() callback will only b=
e called after
+The WMI driver core will take care that the notify_new() callback will on=
ly be called after
 the probe() callback has been called, and that no events are being receiv=
ed by the driver
 right before and after calling its remove() or shutdown() callback.
=20
@@ -146,6 +145,36 @@ the ``no_notify_data`` flag inside struct wmi_driver =
should be set to ``true``.
=20
 Take a look at drivers/platform/x86/xiaomi-wmi.c for an example WMI event=
 driver.
=20
+Exchanging data with the WMI driver core
+----------------------------------------
+
+WMI drivers can exchange data with the WMI driver core using struct wmi_b=
uffer. The internal
+structure of those buffers is device-specific and only known by the WMI d=
river. Because of this
+the WMI driver itself is responsible for parsing and validating the data =
received from its
+WMI device.
+
+The strcture of said buffers is described by the MOF data associated with=
 the WMI device in
+question. When such a buffer contains multiple data items it usually make=
s sense to define a
+C structure and use it during parsing. Since the WMI driver core guarante=
es that all buffers
+received from a WMI device are aligned on a 8-byte boundary, WMI drivers =
can simply perform
+a cast between the WMI buffer data and this C structure.
+
+This however should only be done after the size of the buffer was verifie=
d to be large enough
+to hold the whole C structure. WMI drivers should reject undersized buffe=
rs as they are usually
+send by the WMI device to signal an internal error. Oversized buffers how=
ever should be accepted
+to emulate the behavior of the Windows WMI implementation.
+
+When defining a C structure for parsing WMI buffers the alignment of the =
data items should be
+respected. This is especially important for 64-bit integers as those have=
 different alignments
+on 64-bit (8-byte alignment) and 32-bit (4-byte alignment) architectures.=
 It is thus a good idea
+to manually specify the alignment of such data items or mark the whole st=
ructure as packed when
+appropriate. Integer data items in general are little-endian integers and=
 should be marked as
+such using ``__le64`` and friends. When parsing WMI string data items the=
 struct wmi_string should
+be used as WMI strings have a different layout than C strings.
+
+See Documentation/wmi/acpi-interface.rst for more information regarding t=
he binary format
+of WMI data items.
+
 Handling multiple WMI devices at once
 -------------------------------------
=20
@@ -170,6 +199,7 @@ Things to avoid
 When developing WMI drivers, there are a couple of things which should be=
 avoided:
=20
 - usage of the deprecated GUID-based WMI interface which uses GUIDs inste=
ad of WMI device structs
+- usage of the deprecated ACPI-based WMI interface which uses ACPI object=
s instead of plain buffers
 - bypassing of the WMI subsystem when talking to WMI devices
 - WMI drivers which cannot be instantiated multiple times.
=20
=2D-=20
2.39.5

