Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 16:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355341AbhLDQio (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 11:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355316AbhLDQil (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 11:38:41 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0A1C061751
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 08:35:16 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id x32so18641103ybi.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Dec 2021 08:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=il/vIhlI+W8GvY7WS35IRPzq+xTmUlqG5fBf6HYGkH8=;
        b=P41QzUjoYrb18XLpmAVk9XuTbWU+TILYQlwFFYa1pwwsrCrIg/QLm+uy+ShxWKbuQm
         m25NgyqrWFk7MB0MuveN3gRLEoF4depJJXEkfwBQf75N5jREmTlJNVu8/U5BpCmHrBb6
         Cs4+WQQvl6V4OXYDAi7002U4d02ZtlEfVb1Z9Nj+v46Kfwpfjo98QKDIytXK3RcCWZzy
         1WPdEORAkQTYNCY4qNqfWyPI3p0XA1gfOTlBsKJIzxpTsGEOFhADu/mFsWwtauf+ag8b
         7CkCo7u3rQheha/9mc7nsTxIJkllu9sT+icJXUb8ZZeb0Lkt0uP+OAunRob/zX8HWCQ9
         EnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=il/vIhlI+W8GvY7WS35IRPzq+xTmUlqG5fBf6HYGkH8=;
        b=AeX7nV2EcJ3F6d136VFmBu6lX12+EKz+tg+V5KYaNGdjc3TZ59gzWaI1hrnGrJUAiu
         yUUcCEO0MhYQHoZSH/sbkVhNMWPSUWsSiCO5Ta3HzLNOswG2O4tfXsJa+6msWnel/EFZ
         tuBLoUJ34FRr+v+HL6SJMYaKht+8ycxcYSL5xMPEcA6zToDoW/WYUstYpcUp+FRrSPiw
         rqo5CZqZzm2fPILTALN7vIjd5W1dMOchczVpMwX581Klu3Jp5/w3VJ2TyG1yfrwuFK+N
         DoNhAhLXo813L9hZjZFqe2dSdzlJGNC9ttLchn4gD0Q9hhqv7Zn9iOPT3YXK2yF0o/Ne
         oEWQ==
X-Gm-Message-State: AOAM533LVU+toLN37MPvzxH2wp9ieGqEyznge1iFbpAwcwblCT5A0AZV
        ttCmrci61Hv/6rSCZeE0QAomj3/xjes7q3ZgVcHwWw==
X-Google-Smtp-Source: ABdhPJzmsDPja10p+s6JvU9EsydcbZcjfqieT2bhdVCFdIRgHZtajPr4w+vcCu/amxvvvDimJwUsMhsl/oc5oxwr66w=
X-Received: by 2002:a25:c8c3:: with SMTP id y186mr31410670ybf.20.1638635715516;
 Sat, 04 Dec 2021 08:35:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0d:c906:0:0:0:0:0 with HTTP; Sat, 4 Dec 2021 08:35:15 -0800 (PST)
In-Reply-To: <YaslQCg2G1pWUPVV@kroah.com>
References: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
 <20211203192148.585399-6-martin.fernandez@eclypsium.com> <YaslQCg2G1pWUPVV@kroah.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Sat, 4 Dec 2021 13:35:15 -0300
Message-ID: <CAKgze5Yw6=PjY9+cn=FKX5UsiSon5rVOK_Gc-3Hs8dQspSFaYA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drivers/node: Show in sysfs node's crypto capabilities
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        rafael@kernel.org, rppt@kernel.org, akpm@linux-foundation.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alex.bazhaniuk@eclypsium.com, alison.schofield@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 12/4/21, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> You forgot a Documentation/ABI/ update for this new sysfs file you
> added :(
>

Damn, I forgot to add it to the patch. It will be in my next patch,
this is what it looks like:

diff --git a/Documentation/ABI/testing/sysfs-devices-node
b/Documentation/ABI/testing/sysfs-devices-node
new file mode 100644
index 000000000000..ab46fdd3f6a8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-node
@@ -0,0 +1,10 @@
+What:		/sys/devices/system/node/nodeX/crypto_capable
+Date:		October 2021
+Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
+Users:		fwupd
+Description:
+		This value is 1 if all system memory in this node is
+		marked with EFI_MEMORY_CPU_CRYPTO, indicating that the
+		system memory is capable of being protected with the
+		CPU=E2=80=99s memory cryptographic capabilities. It is 0
+		otherwise.
\ No newline at end of file
