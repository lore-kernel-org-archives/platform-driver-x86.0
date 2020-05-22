From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] iio: remove left-over parent assignments
Date: Fri, 22 May 2020 11:53:50 +0300
Message-ID: <CAHp75VewoA-jcRDpvNdoRyS4Tdaw_QsBDJ5_ETc6crwuuefdyg@mail.gmail.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-5-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20200522082208.383631-5-alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Alexandru Ardelean <alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: milo.kim-l0cyMroinI0@public.gmane.org, tomislav.denis-jb26L5wWkzc@public.gmane.org, Dan Robertson <dan-d1oNz5vA2fxXqviUI+FSNg@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eddie James <eajames-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Song Qiang <songqiang1304521-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, "open list:STAGING SUBSYSTEM" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list <bcm-k>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, May 22, 2020 at 11:37 AM Alexandru Ardelean
<alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org> wrote:
>
> These were found by doing some shell magic:
> ------------
> for file in $(git grep -w devm_iio_device_alloc | cut -d: -f1 | sort | uniq) ; do
>         if grep 'parent =' $file | grep -v trig | grep -vq devm_; then
>                 echo "$file -> $(grep "parent =" $file)"
>         fi
> done
> -----------

Side note: time to learn coccinelle or shell better :-)

-- 
With Best Regards,
Andy Shevchenko
