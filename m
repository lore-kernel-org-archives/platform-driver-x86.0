Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D195E81E1B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbjJFRdO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjJFRdN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:33:13 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D44AD
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:33:12 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso434400766b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696613591; x=1697218391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bSF4KB8Zm6SMCrn3wNPPhJbOr4da0gwDqApegVShCo=;
        b=DFrHmmi7GRYrBO6aN9n4GmreGzHfQjgLZfXaHttEu5v8+IwIm4Pvx6dsf292nuovNw
         e8NA066Jcz4R0jDDvtClQF5L42nWwl8DKiwmR2X7x5eEhDBrr33fvHcXtL6QAlMb9d4i
         XjS1xQim/LEHm99WjFEybfEJYEC3r5U9IxDe+6VHSSmWATva1uCo9TcqS1bU5hDIoXDd
         0pVZccfakPyfHHTbAHjqtHP+CO+bQsKY5i+UhfdWCK1r0FNiiwzdD6sAiIG/+pZ9CXrI
         BNLy0gSdO0/VtdxiUQvQ+oE4T2gkH9k3s9Kr/9Un/htjBuUCCabQ6cZQpC4wrrUMqCG4
         MM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696613591; x=1697218391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bSF4KB8Zm6SMCrn3wNPPhJbOr4da0gwDqApegVShCo=;
        b=QBxLKxqVZLJ3OmLXww30csFRDzaJbVmaCzIgSU/DzLNys1eelv1ZsueBp39rEpilsd
         GA2owYWIN/sqSPJJFv63QP2mdXaEvGeUsfaMB2vjfKmN8dxweEJGigbdfqn/G2YTrcKe
         aAA7tFk+L0sfKKdK5iNObiH4ZpN74Pku4J2pIJdB7SZ6wXnKugXupqGCj15yht453J2B
         hheNV/lBZ0gvlCVnx16TP3S+kU9m9Dn1549ltzGGZkJ6kDao3ZYNQtPVzxBXyo1tMZwD
         osR5o6QQGrvaLnlFRbXfWrI27Rk0Wxb4FsmDWNdTMXWRedbFkJHre7Qbws6xF+J2PEOM
         aNeA==
X-Gm-Message-State: AOJu0YwVw9GdXgwyMCXPfmpw909PVJDbhGNx8mF6z3wQxXjbWfROTYI5
        sx0bJvDP8t3mChfkZ+jU0+fsLAO7B3VMMUVrtSAowN4K
X-Google-Smtp-Source: AGHT+IEn/eSjm1NGrIK3wyhDWuE9Msx0LtKkMVq47HUeJFgLelzzETfIl8R5fropoAwJBbyvtlozS0lTFQOLd26bJt4=
X-Received: by 2002:a17:906:208:b0:9ae:2f33:4ad0 with SMTP id
 8-20020a170906020800b009ae2f334ad0mr7610754ejd.71.1696613590539; Fri, 06 Oct
 2023 10:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230929113149.587436-1-teackot@gmail.com> <20230929113149.587436-3-teackot@gmail.com>
 <b7bfc6a9-1dcc-89a8-c8a8-515d56faf35@linux.intel.com> <575ef025-8d1a-98f8-dfba-e8f3cde019c0@redhat.com>
In-Reply-To: <575ef025-8d1a-98f8-dfba-e8f3cde019c0@redhat.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Fri, 6 Oct 2023 20:32:59 +0300
Message-ID: <CAPXvF04zr4XL2FvVhEjWLQkRAwpv85jr4wo1DWskZoCjc3Q9-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: msi-ec: Fix the 3rd config
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi!

Thank you for the comments, I will send a modified patch series soon!

Regards,
Nikita
