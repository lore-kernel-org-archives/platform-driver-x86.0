From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH v1 0/9] platform/x86: hp-wmi: Driver refactoring and cleanups
Date: Thu, 20 Apr 2017 11:06:04 +0200
Message-ID: <CAOQ7t2b4B4V5c0qNY1jk-qO=LjPQhKV6vGg8p2ofEV1=fbHdqw@mail.gmail.com>
References: <cover.1492654448.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 20, 2017 at 4:25 AM, Darren Hart <dvhart@infradead.org> wrote:
>
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
>
> This series factors out some redundant code, cleans up a number of style issues,
> modernizes the sysfs usage, and cleans up the return paths. All told, the driver
> is reduced in size by 37 lines (3.6%).
>
> I do not have an HP laptop, so I'm hoping Carlo can help out with some testing.
> In particular we need to verify that hotkeys and sysfs continue to work as
> before.

On my HP 240 G5:

Tested-by: Carlo Caione <carlo@endlessm.com>

Cheers,

-- 
Carlo Caione
