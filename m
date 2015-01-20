From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH v2 3/3] asus-laptop: cleanup is_visible
Date: Tue, 20 Jan 2015 13:20:36 -0500 (EST)
Message-ID: <810077082.264036.1421778036663.JavaMail.root@mail>
References: <CAHR064jkFMd3FWxGvOrE0FfXzLHoQSb9LU8Mi_AZk-CST01Sqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHR064jkFMd3FWxGvOrE0FfXzLHoQSb9LU8Mi_AZk-CST01Sqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com
List-Id: platform-driver-x86.vger.kernel.org

Hi Corentin,

> > Use the attribute indexes and concise the if statements.
> >
> Why ? I really don't see that as an improvement.

The improvement is code clarity and maintainability. I'm not use we want
to keep multiple returns and this goto thing. I think per-attribute 
if-statements are clearer.

Thanks,
-v
