Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4208BC6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 11:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjCJL5h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 06:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjCJL50 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 06:57:26 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BEBB756
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 03:57:21 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso3273329wmo.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 03:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678449440;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykvUTHgoBtlncwE0np1wK4I/EKLppMw6R1eHi36c+rg=;
        b=kDxBazWk1VKnMJthCJmEkYZPkn3CtZ6GZuq5d0pVqkNWtVQeP0skvBrUrsRNHhaQsE
         f2nQaDmgwA2fDPE5sAma30jKkuKtaxxcwqM/JGdtQpwJxGcAVZbsGEMBqGd6IfykaqBw
         R4sI1mxw34dF3KP7LmUdmtnJmuatmmtNmg+CVonFkb4UtjvJV6H1UNs3C3u/USNT3GhG
         dweo1pYJOzP2s2PvS3q+abHluXkzlvcjD9BxhVvoWDW2oQN6C5KomFRQwa7O5E1PMF03
         5RyOl6/MtXhLRtxmIwkfICM3rr/9rq+DJatL0vrhSthcwGhDZOYgxnVzEvefIUoPP1tG
         CyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678449440;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykvUTHgoBtlncwE0np1wK4I/EKLppMw6R1eHi36c+rg=;
        b=vPhJjELdF810Ck9HGJnEZI530Oa0EFG0WO2MQZmBdzcvwl5CXOp7SbKbfeHR4eT3vn
         VNw7MOGiyFsdLxDpd1fQcqqkrOkV36dMe7sLwFS6DVNUjvfGvypjLP+WNLhjYvxPepsp
         ToN0wcjesC7fVR9ukBUl1qpW1GV+KayAD65u79lb0SwiEKOFYxXv8aRDXRKTlftCRsOq
         +yDJy5+SV+B+7Jvc55WKHyYhhgA4cq6lrcfeDWMJ1eSnQZ7t74M69iriO96niRWjor9e
         1NrcmqNyuWhVoYVVORfZQxdncX9JiOgelmHAwM4yuk+nLDA9ac26+i4oGuYG1r/MuY6U
         lOww==
X-Gm-Message-State: AO0yUKVZcAz8mqV4aEYhqA+lcb28ArnIltrF9shKhdE8jl9QxUK4x/7D
        T2hbbLTU8FMvG544GKBqtz4=
X-Google-Smtp-Source: AK7set/jRAnuVngUoY5p89kqh4yXVIWZmvWpdLdgcq74IdAehH9/SSJFScTBOdxz90WkLmigqVmyMQ==
X-Received: by 2002:a05:600c:540a:b0:3ea:e582:48dd with SMTP id he10-20020a05600c540a00b003eae58248ddmr2369504wmb.34.1678449439913;
        Fri, 10 Mar 2023 03:57:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcde8000000b003e01493b136sm2724093wmj.43.2023.03.10.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 03:57:19 -0800 (PST)
Date:   Fri, 10 Mar 2023 14:57:15 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: ISST: Add IOCTL default callback
Message-ID: <25a8ef35-5274-4990-a683-040aacaa8d3a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Srinivas Pandruvada,

The patch 33c16dc1a2d1: "platform/x86: ISST: Add IOCTL default
callback" from Feb 10, 2023, leads to the following Smatch static
checker warning:

	drivers/platform/x86/intel/speed_select_if/isst_if_common.c:629 isst_if_def_ioctl()
	info: return a literal instead of 'ret'

drivers/platform/x86/intel/speed_select_if/isst_if_common.c
    615         case ISST_IF_MSR_COMMAND:
    616                 cmd_cb.cmd_size = sizeof(struct isst_if_msr_cmd);
    617                 cmd_cb.offset = offsetof(struct isst_if_msr_cmds, msr_cmd);
    618                 cmd_cb.cmd_callback = isst_if_msr_cmd_req;
    619                 ret = isst_if_exec_multi_cmd(argp, &cmd_cb);
    620                 break;
    621         default:
    622                 for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
    623                         struct isst_if_cmd_cb *cb = &punit_callbacks[i];
    624                         int ret;
    625 
    626                         if (cb->def_ioctl) {
    627                                 ret = cb->def_ioctl(file, cmd, arg);
    628                                 if (!ret)
--> 629                                         return ret;

This returns the first time something succeeds.  Normally it would be
the other way around, where we return the first time something fails.
If this is really intentional it would be better to do an explicit
"return 0;"

    630                         }
    631                 }
    632                 break;
    633         }
    634 
    635         return ret;
    636 }

regards,
dan carpenter
