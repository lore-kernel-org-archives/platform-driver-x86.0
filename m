From: Anthony Wong <ypwong@gmail.com>
Subject: Re: [PATCH] acer-wmi: only supports AMW0_GUID1 on acer family
Date: Thu, 3 Nov 2016 11:40:15 +0800
Message-ID: <CAE7LaDAmQjjToC8n6mLNM8dJf1Vm4QN7wu7-Hk8=dwRp2XyfsA@mail.gmail.com>
References: <1477974658-12589-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477974658-12589-1-git-send-email-jlee@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>
List-Id: platform-driver-x86.vger.kernel.org

On 1 November 2016 at 12:30, Lee, Chun-Yi <joeyli.kernel@gmail.com> wrote:
>
> The AMW0_GUID1 wmi is not only found on Acer family but also other
> machines like Lenovo, Fujitsu and Medion. In the past days, acer-wmi
> driver handled those non-Acer machines by quirks list.
>
> But actually acer-wmi driver was loaded on any machines that have
> AMW0_GUID1. This behavior is strange because those machines should
> be supported by appropriate wmi drivers. e.g. fujitsu-laptop,
> ideapad-laptop.
>
> So, This patch adds the logic to check the machine that has AMW0_GUID1
> should be in Acer/Packard Bell/Gateway white list. But, it still keeps
> the quirk list of those supported non-acer machines for backward
> compatible.
>
> Tested-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Cc: Darren Hart <dvhart@infradead.org>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Xiaomi Air 13.3 notebook suffers from the same issue, acer-wmi
basically has no use on this machine. With your patch, acer-wmi no
longer loads.

Tested-by: Anthony Wong <anthony@ypwong.org>

Thanks,
Anthony
