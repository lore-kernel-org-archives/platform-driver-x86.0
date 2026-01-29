Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CF33DEE2
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682913; cv=pass; b=BHTN1kvZe4YO2R30tARz36izyuzyuWJhwWNpSKz5cHTkSV+Wsn3RbEUwdTM8uZ8EoD9tav6Vu4/Jn8mQoN//xSwCWk0tk/1WgwPBAxiuyedap+2rvt2wn1LUC27BBAjWlRS+OlZR2AhIjboH5B0KCxs2QdNhG9jgIbK+AxME/04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682913; c=relaxed/simple;
	bh=0Rqkd5E+lJIMR3neDNcIUoL3NZ+GytE+DRt0eC8C52M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aK4IX9cfeHHTXuFE0i9OP7y7f610mNbA7f9fRbmdjGI21loFIYjQ6Lc/ccmF6O9zoLteFmMLgiBpJCyZEI609jP1gIhaDzi0TDMdjIqvK+FE3DLVVn0lFSjNwNLBDPOwVZEi9bcWgxM23siml4fKMf8tsPaxEk+8Jl84z7uKctY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbcjN7Cs; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbcjN7Cs"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7947be0850cso8310667b3.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 02:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769682911; cv=none;
        d=google.com; s=arc-20240605;
        b=dVb92INDl3cSH7eWpQnaLH/jiTls4+fBnBNRQOLsxUWJ3nGW1/Frn5fyNgOJVrSE1r
         HSr2kRLMwQ6sG+Dj0zJa+/RDzHVq4sNvRm1djdBhD2gSqFgjckc3x3ruvwsbNy9reQJj
         GdulJtNEdMf0tkMmDGHysNHzIytqzpyecg4whnUFBVKKCPhbGvD0CApqoTyIsrKPZf00
         jqzLEaGa++QFyqaRvkxzcXWRoGFbbhd5Emf6gWfA+y5rW7r4JMp6ZIaTpi71c4nM96TE
         LRKyTk+me97NhDSBF7CpUROaxFLGXVnrLD+QDGnUXgcov+MbvXWBmUVn4JsHzfXg+oek
         cpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=0Rqkd5E+lJIMR3neDNcIUoL3NZ+GytE+DRt0eC8C52M=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=Fv/m6TuC6yAbFVvONR2hPt+88C7lRoOsdWGg6C1eo9k52IhcMSs6ss19ajBrTDG/ov
         YG4mLhLx+O963Jwj6lYenK8K/TEQdy/0ibh14HhpasNrGIw5pYSQ94Fo4wiOrcKDGhwO
         l7YzGYUyptYiqdYpkzA9ZcqhGDlRpn6fj4rwyZrcwC/6uPhJne/ceOuRTr1KGAPx2cA0
         w6P3hWxU1z7pfB3QOSIENiPkKz8dJJ6icSzfR3wJBOLOCQo8MnRxzD+aDvH+sG5jv/bh
         03PFj66YPUfJeV54ogYt3Tl/QDi9Np15/QElBEvPT2pMjw2Ae8wgYe29BwDOKQ4le3vm
         Rc6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769682911; x=1770287711; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Rqkd5E+lJIMR3neDNcIUoL3NZ+GytE+DRt0eC8C52M=;
        b=GbcjN7Cs4pCY7ToRKEeNSwpahEI5w7qH8tjiFBFu9/4QzcFZ7Pd5O1YzQIFPlOfw9i
         eRq1vVlJ9avL5heeYjpd4RJdIDlWhiK7sLmKE/lBa3/fXNlPsfPHsZzaG1hwwJ7OcmUu
         KZZE8UHORe8QX/EaXkyInXxCw2/eCjrnlc4c5pIfeSXyVdqbbruPe6TNO1il/D43JCcz
         MuEXPvkDMVUAOKO7MF623oWmidHoZtSApqvbDkzIYEEIzbEXTagHvisE0DvmpkbIS9/F
         c1MdVH50xxb4uCagRpI1v+zDtnDGYE963bILo7thk10Mho/Jv52usopGI+L+OSR5qI6O
         pnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682911; x=1770287711;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Rqkd5E+lJIMR3neDNcIUoL3NZ+GytE+DRt0eC8C52M=;
        b=UzkbFFMMqrEx838QG4xRB7jkwTe3XkrR7/2ui1JzFh2Oe4jlSqmjJ0V0q2jui204fo
         qyuYy8rdA7OTBHPYgi9kZKrv4bYlf+kcfjbXnT6bsnU7Kb6bBuTgevv/3euXNgWXOmTL
         0uloYv79e8C5DQKu8hWYdlc9gj1nHoi6eFy8b9aWv0Pp01jBGTosmhZMw8fENqUaU6O4
         Tmrz77b5DU9x7HmvFmy7bIT8AA6C8U3RDJzMsBY7+kUqEEKY8GzypvKMeHAnaeQgxbZA
         +H6pbbSSVXd0AuFbYuTDvBabVM+H+qH/xlb85hPvgecIscK5ErSD65CtbvVAX85vO2fb
         6wFQ==
X-Gm-Message-State: AOJu0YzJ2gpllNsbIVq7byCxp6C8VNGvo1mnR+WYwC6vzsOZB7jielNQ
	RfkarqEO0rkl37P5RNHfqU17eRfuHINFqHcWvABcdckJbr9EKQuKKWCIEu8A3SbljZfbelOfYNX
	bOZBX9m38wfAXAB99CQPDH2D/YgcLwowRNwVzOzo=
X-Gm-Gg: AZuq6aID+h4ivLH0+XFEg7grOWWaqhOgXNGBujzVVs50EkYjUurtPOdsI7xkt7SwNM1
	X7Oja74OPDyOy2aaqY+DKB03ZQMl/8KDqc+MQ+26Od9ZsNNcX0N4PFpSU5qWrrdeURQJL4qrjm1
	ICFEJ13qJC2nbecwczReun+wX51Q1ZEZDOzWy3yJqcmBMl4ajPqsnYxG8dhB0mAf3U5dOjYqHqU
	ycZ4PpJwIr+psVNUoRabTmqFfGGnVpKGquJcA2Z4QMC18clqs9DMbW6+9MeRUn2UFkZXGjXveBs
	l7JVQvSI9Q==
X-Received: by 2002:a05:690c:fc1:b0:794:18b4:ae9 with SMTP id
 00721157ae682-7947ab626ffmr68828857b3.25.1769682911171; Thu, 29 Jan 2026
 02:35:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Edip_Deniz_Ang=C4=B1?= <23edip@gmail.com>
Date: Thu, 29 Jan 2026 11:34:59 +0100
X-Gm-Features: AZwV_QgSfGByQRiqAGxeg5rHg12fQdy7VX_XQBP5DNRauH6bOEk0Jy7bsj0UOjs
Message-ID: <CAP3yi-BWm0LqkhfzTrGy5n-KQ=3+T8eRMoR+Z+7Ke2VJB43kTA@mail.gmail.com>
Subject: Missing device from dmi_vgbs_allow_list[]
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I have a Dell laptop which uses intel-hid driver to report its
SW_TABLET_MODE event. In the current mainline linux kernel, since this
specific laptop is not in dmi_vgbs_allow_list[], the event gets
reported as an UNKNOWN event therefore neither Gnome nor KDE detects
the switch. The DMI values required is as follows:
Manufacturer: Dell Inc.
Product Name: Dell 16 Plus 2-in-1 DB06250

Since I've never contributed to Linux Kernel I wasn't sure whether I
should've just submitted a patch or just report it like this so please
let me know if a maintainer would prefer to just insert the values to
the struct or should I submit a patch. If you would prefer me to do
the latter please let me know if there is anything extra I need to do
to contribute to this subsystem other than the requirements listed in
https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html
link. Thanks.

Kind regards,
Edip Deniz Ang=C4=B1
