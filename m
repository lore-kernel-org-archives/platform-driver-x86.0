Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463E7CDB474
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjJRAx0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 20:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjJRAxZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 20:53:25 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA9FF7
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 17:53:24 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77574c2cffdso532047085a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 17:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697590402; x=1698195202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2VIeOaaByKETDBzc6AEgIaZ7Jz6agXmQ69DoqsmcFE=;
        b=aM6dlopO1RhAHokZjOf8fvQ4WQLFtPeknT1G4C6J1dFlZD4uDBURUS0h4SKwMg+Bzi
         BKgkqZGiWndtw9ceW6tBDEoGS0SXR2j2EouXFP6OSJwFnXY/rByqAyrLBUlYVlOdCweY
         Ml9u7JrjEx7zEr5/VqfTd7fjI8Dm/Lk9ceyd+l2FN8+Qdg3RbOXth6O9jqtGEs3D4sDM
         MNSQJLLTu9e8VKKZfp5xTd9P89FGvwY10REPWavWLWt0UfILjiiFv/uh9nuZIBgqjZYB
         keb3S9ULWshsQ/mq0cuJJhf4udAVajN76HWf+2HaEgYrcKM3uMS4q3QlIV59SB+IqlM2
         qhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590402; x=1698195202;
        h=content-transfer-encoding:cc:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2VIeOaaByKETDBzc6AEgIaZ7Jz6agXmQ69DoqsmcFE=;
        b=w5lhHCLzoIr4zlfGWWcI7VmQLIf8DeljSiJ5PQjQuBPoVbNU98BlGVNGUJvVVVIRVQ
         ClvuDLM6l1VyJ273mAq/FszhOqCumqA1IFu5Ub4qAtY4Oa6kM4srFQA7VcnHGwgdAXFs
         jUdYe1rcF/UxTSmPGbKEwrikc2gsZRijFzbmLjc82xN3ENwliJwwF6hUVLvA+YQPrScH
         Wa54tzWKzzXYfx9a/VfZ/WbrVdfZPU6Jq1HIfJfS0lyEsdTRXhoCFGual6j9T0/TePda
         YJ9iwQMc1HjhN6NwuztsKm0LBC0vr/LxuhIqDf/fWIj7vI8Gzdpr30Vv0ZamR5VfsLQg
         lplQ==
X-Gm-Message-State: AOJu0YzeJ90Tnr4s6H4LWUYbxP2ICHJ54RPagVxMg120u0vAVHLjJ7rt
        Bi1ZNV/ZJaA8+Oi9oua//3EcULtxfZpCWA==
X-Google-Smtp-Source: AGHT+IFvEJAR/yD5iav07EtLcGnZgQndoEsrt9lHhuzYJ0ZGYivRypUKmuPA8eoLJKFGQBFocNdXQA==
X-Received: by 2002:a05:620a:19a1:b0:774:19a4:117a with SMTP id bm33-20020a05620a19a100b0077419a4117amr4932334qkb.19.1697590402505;
        Tue, 17 Oct 2023 17:53:22 -0700 (PDT)
Received: from ?IPV6:2607:fea8:4adc:dd40::6352? ([2607:fea8:4adc:dd40::6352])
        by smtp.gmail.com with ESMTPSA id de20-20020a05620a371400b007743360b3fasm1091418qkb.34.2023.10.17.17.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 17:53:22 -0700 (PDT)
Message-ID: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
Date:   Tue, 17 Oct 2023 20:53:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From:   Arnold Gozum <arngozum@gmail.com>
Subject: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
Cc:     platform-driver-x86@vger.kernel.org, acelan.kao@canonical.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

In Linux 5.11, Dell Inspiron 7352 was added to the
dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
10 (actually it was me who submitted the patch).

However, the tablet mode switch can be unreliable. Randomly, switch
events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
which I have tested by running evtest while flipping the device to and
from tablet mode. This is fixed after a reboot, or a suspend followed by
unloading and reloading the intel-vbtn module. It can also sometimes be
the case that upon resume, SW_TABLET_MODE does not reflect the actual
state of the device, which is fixed by physically flipping the screen
back and forth to update the state.

Because of these issues, I think this model should be removed from the
allow list, unless more investigation should be done.

Thanks,
Arnold
