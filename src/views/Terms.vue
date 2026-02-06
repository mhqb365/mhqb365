<template>
  <div class="policy-page" :data-lang="lang">
    <div class="container">
      <div class="policy-surface">
        <header class="page-header">
          <h1 class="lang-en">Terms of Service</h1>
          <h1 class="lang-vi">Điều khoản sử dụng</h1>
          <p class="meta">
            <span class="lang-en"
              >Effective: February 6, 2026 • Last updated: February 6,
              2026</span
            >
            <span class="lang-vi"
              >Hiệu lực: 6 Tháng 2, 2026 • Cập nhật lần cuối: 6 Tháng 2,
              2026</span
            >
          </p>
          <div class="lang-toggle">
            <button :class="{ active: lang === 'en' }" @click="setLang('en')">
              English
            </button>
            <button :class="{ active: lang === 'vi' }" @click="setLang('vi')">
              Tiếng Việt
            </button>
          </div>
          <div class="lead-card border-box">
            <p class="lang lang-en">
              By using mhqb365.com you agree to these Terms and the Privacy
              Policy.
            </p>
            <p class="muted lang lang-vi">
              Khi sử dụng mhqb365.com bạn đồng ý với Điều khoản này và Chính
              sách quyền riêng tư.
            </p>
          </div>
        </header>

        <!-- English version -->
        <div class="lang-pane lang-en">
          <section class="grid">
            <article class="card border-box">
              <h2>Service Description</h2>
              <p>
                mhqb365.com is a web application that lets you sign in with
                Google and use the features published on our site.
              </p>
            </article>
            <article class="card border-box">
              <h2>Acceptance</h2>
              <p>
                Using the service means you accept these Terms. If you do not
                agree, stop using it.
              </p>
            </article>
            <article class="card border-box">
              <h2>Accounts & Security</h2>
              <ul class="list">
                <li>
                  You are responsible for your account and for keeping login
                  information safe.
                </li>
                <li>Notify us immediately of unauthorized use.</li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Acceptable Use</h2>
              <ul class="list">
                <li>
                  Do not misuse Google APIs, attempt to break security, or
                  interfere with the service.
                </li>
                <li>Do not upload illegal, harmful, or infringing content.</li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Fees</h2>
              <p>
                The service is currently free; if pricing is introduced, we will
                notify you before it takes effect.
              </p>
            </article>
            <article class="card border-box">
              <h2>Intellectual Property</h2>
              <ul class="list">
                <li>
                  Site code, design, and branding belong to mhqb365.com or
                  licensors.
                </li>
                <li>
                  You keep ownership of content you submit but grant us a
                  limited license to operate the service.
                </li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Third-Party Services</h2>
              <p>
                We rely on Google OAuth and other vendors. Their terms may apply
                in addition to ours.
              </p>
            </article>
            <article class="card border-box">
              <h2>Suspension & Termination</h2>
              <p>
                We may suspend or terminate access for breaches of these Terms,
                security risks, or legal reasons. You may stop using the service
                anytime and can request data deletion.
              </p>
            </article>
            <article class="card border-box">
              <h2>Availability & Changes</h2>
              <p>
                The service may change, be updated, or be discontinued. We aim
                to give notice of major changes.
              </p>
            </article>
            <article class="card border-box">
              <h2>Disclaimers</h2>
              <p>
                The service is provided “as is” without warranties. We do not
                guarantee uninterrupted or error-free operation.
              </p>
            </article>
            <article class="card border-box">
              <h2>Limitation of Liability</h2>
              <p>
                To the maximum extent allowed by law, we are not liable for
                indirect, incidental, or consequential damages arising from the
                service.
              </p>
            </article>
            <article class="card border-box">
              <h2>Governing Law & Disputes</h2>
              <p>
                These Terms are governed by the laws of Viet Nam (update to your
                registered jurisdiction). Disputes will first be resolved
                amicably; if unresolved, they may be brought to competent courts
                or arbitration in that jurisdiction.
              </p>
            </article>
            <article class="card border-box">
              <h2>Updates</h2>
              <p>
                When Terms change, we will post the new version here with a new
                effective date. Continued use after that date means acceptance.
              </p>
            </article>
            <article class="card border-box">
              <h2>Contact</h2>
              <p>
                Email: <a href="mailto:mhqb365@gmail.com">mhqb365@gmail.com</a>.
              </p>
            </article>
          </section>
        </div>

        <!-- Vietnamese version -->
        <div class="lang-pane lang-vi">
          <section class="grid">
            <article class="card border-box">
              <h2>Mô tả dịch vụ</h2>
              <p>
                mhqb365.com là ứng dụng web cho phép bạn đăng nhập bằng Google
                và sử dụng các tính năng được công bố trên trang.
              </p>
            </article>
            <article class="card border-box">
              <h2>Chấp nhận</h2>
              <p>
                Việc sử dụng dịch vụ đồng nghĩa bạn chấp nhận Điều khoản này;
                nếu không đồng ý, vui lòng ngừng sử dụng.
              </p>
            </article>
            <article class="card border-box">
              <h2>Tài khoản & bảo mật</h2>
              <ul class="list">
                <li>
                  Bạn chịu trách nhiệm về tài khoản và bảo vệ thông tin đăng
                  nhập.
                </li>
                <li>Báo ngay cho chúng tôi nếu phát hiện sử dụng trái phép.</li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Sử dụng chấp nhận được</h2>
              <ul class="list">
                <li>
                  Không lạm dụng API của Google, không xâm phạm bảo mật, không
                  gây gián đoạn dịch vụ.
                </li>
                <li>
                  Không tải lên nội dung vi phạm pháp luật, độc hại hoặc xâm
                  phạm quyền.
                </li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Phí</h2>
              <p>
                Hiện dịch vụ miễn phí; nếu áp dụng phí, chúng tôi sẽ thông báo
                trước khi hiệu lực.
              </p>
            </article>
            <article class="card border-box">
              <h2>Quyền sở hữu trí tuệ</h2>
              <ul class="list">
                <li>
                  Mã nguồn, thiết kế, thương hiệu thuộc mhqb365.com hoặc bên cấp
                  phép.
                </li>
                <li>
                  Bạn giữ quyền sở hữu nội dung gửi lên, cấp cho chúng tôi quyền
                  sử dụng hạn chế để vận hành dịch vụ.
                </li>
              </ul>
            </article>
            <article class="card border-box">
              <h2>Dịch vụ bên thứ ba</h2>
              <p>
                Chúng tôi sử dụng Google OAuth và các nhà cung cấp khác; điều
                khoản của họ có thể áp dụng song song.
              </p>
            </article>
            <article class="card border-box">
              <h2>Tạm ngưng & chấm dứt</h2>
              <p>
                Chúng tôi có thể tạm ngưng hoặc chấm dứt truy cập khi vi phạm
                Điều khoản, rủi ro bảo mật, hoặc lý do pháp lý. Bạn có thể dừng
                sử dụng bất kỳ lúc nào và yêu cầu xóa dữ liệu.
              </p>
            </article>
            <article class="card border-box">
              <h2>Khả dụng & thay đổi</h2>
              <p>
                Dịch vụ có thể thay đổi, cập nhật hoặc dừng cung cấp; chúng tôi
                cố gắng thông báo khi có thay đổi lớn.
              </p>
            </article>
            <article class="card border-box">
              <h2>Tuyên bố miễn trừ</h2>
              <p>
                Dịch vụ được cung cấp “nguyên trạng”, không bảo đảm không gián
                đoạn hoặc không lỗi.
              </p>
            </article>
            <article class="card border-box">
              <h2>Giới hạn trách nhiệm</h2>
              <p>
                Trong phạm vi pháp luật cho phép, chúng tôi không chịu trách
                nhiệm cho thiệt hại gián tiếp, ngẫu nhiên hoặc hệ quả từ việc sử
                dụng dịch vụ.
              </p>
            </article>
            <article class="card border-box">
              <h2>Luật áp dụng & tranh chấp</h2>
              <p>
                Điều khoản chịu sự điều chỉnh của luật Việt Nam (hãy cập nhật
                theo nơi đăng ký của bạn). Tranh chấp ưu tiên giải quyết thương
                lượng; nếu không thành, đưa ra tòa án/trọng tài có thẩm quyền
                tại đó.
              </p>
            </article>
            <article class="card border-box">
              <h2>Cập nhật</h2>
              <p>
                Khi Điều khoản thay đổi, chúng tôi đăng bản mới kèm ngày hiệu
                lực; tiếp tục sử dụng sau ngày đó đồng nghĩa bạn chấp nhận.
              </p>
            </article>
            <article class="card border-box">
              <h2>Liên hệ</h2>
              <p>
                Email: <a href="mailto:mhqb365@gmail.com">mhqb365@gmail.com</a>.
              </p>
            </article>
          </section>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLang } from "../composables/useLang";

const { lang, setLang } = useLang();
</script>

<style scoped>
.policy-page {
  padding: 64px 0 96px;
  color: #111827;
  font-family: "Inter", sans-serif;
}

.policy-surface {
  background: #f6f7fb;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(15, 23, 42, 0.08);
  padding: 32px 28px;
}

.page-header {
  display: grid;
  gap: 12px;
  margin-bottom: 32px;
}

.eyebrow {
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: #2563eb;
  font-size: 12px;
  margin: 0;
  font-weight: 700;
}

.page-header h1 {
  color: #0f172a;
  margin: 0;
}

.meta {
  margin: 0;
  color: #475569;
}

.lang-toggle {
  display: inline-flex;
  gap: 8px;
  margin: 4px 0 8px;
}

.lang-toggle button {
  border: 1px solid #cbd5e1;
  background: #ffffff;
  color: #0f172a;
  padding: 8px 14px;
  cursor: pointer;
  font-family: "Inter", sans-serif;
  border-radius: 6px;
  transition: all 0.2s;
}

.lang-toggle button.active {
  border-color: #2563eb;
  color: #0f172a;
  background: #e0ecff;
  box-shadow: 0 1px 2px rgba(15, 23, 42, 0.08);
}

.lead-card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(15, 23, 42, 0.06);
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 16px;
}

.card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  display: grid;
  gap: 8px;
  box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
}

.card h2 {
  margin: 0;
  color: #0f172a;
}

.card p {
  margin: 0;
  color: #111827;
}

.muted {
  color: #475569;
}

.list {
  list-style: disc;
  padding-left: 18px;
  display: grid;
  gap: 8px;
  margin: 0;
}

.list li {
  line-height: 1.6;
}

.policy-page a {
  color: #0b57d0;
  text-decoration: underline;
}

.policy-page a:hover,
.policy-page a:focus {
  color: #063b8f;
}

.list a {
  color: #0b57d0;
  text-decoration: underline;
}

.list a:hover {
  color: #063b8f;
}

[data-lang="en"] .lang-vi {
  display: none;
}

[data-lang="vi"] .lang-en {
  display: none;
}

@media (max-width: 768px) {
  .policy-page {
    padding: 48px 0 72px;
  }

  .policy-surface {
    padding: 24px 20px;
  }

  .grid {
    grid-template-columns: 1fr;
  }
}
</style>
